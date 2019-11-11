import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_wei/config/app_config.dart';
import 'package:flutter_wei/constants/app_err_msg.dart';
import 'package:flutter_wei/constants/sp_constant.dart';
import 'package:flutter_wei/model/Result.dart';
import 'package:flutter_wei/utils/date_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 通用的发送请求
Future<Result> request(String path, var requestBody) async {
  Result result = new Result();
  try {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map<String, dynamic> headers = {
      'Session-Key': sp.getString(SpConstant.SESSION_KEY)
    };
    print('sessionKey:${sp.getString(SpConstant.SESSION_KEY)}');
    Options options = new Options(
      baseUrl: EnvInfo.host,
      headers: headers,
      path: path,
      method: 'POST',
      responseType: ResponseType.JSON,
    );
    Dio dio = new Dio();
    print(
      'request：baseURL:${options.baseUrl}，path:${options.path}，method=${options.method}',
    );
    var response = await dio.post(
      path,
      data: requestBody,
      options: options,
    );
    print('request result:${response.data}');
    Map resultData = response.data;
    result = Result.fromJson(resultData);

    return result;
  } catch (exception) {
    print(exception.toString());
    return Result.genErrorMsg(AppErrMsg.REQUEST_ERROR);
  }
}

/// 上传文件到OSS
Future<Result> uploadFileToOss(File file, String fileName) async {
  Result result = new Result();
  try {
    DateTime expireTime = DateTime.now().add(
      Duration(days: 365 * 10),
    );
    String policyText =
        '{"expiration": "${DateUtil.toZString(expireTime)}","conditions": [["content-length-range", 0, 1048576000]]}';
    print('policyText: ${policyText}');
    String policy_base64 = base64.encode(utf8.encode(policyText));
    List<int> policy = utf8.encode(policy_base64);

    /// 进行utf8 编码
    List<int> key = utf8.encode(EnvInfo.accessKeySecret);

    /// 通过hmac,使用sha1进行加密
    List<int> signature_pre = new Hmac(sha1, key).convert(policy).bytes;

    /// 最后一步，将上述所得进行base64 编码
    String signature = base64.encode(signature_pre);
    print('signature :${signature}');

    /// dio的请求配置，这一步非常重要！
    Options options = new Options();
    options.responseType = ResponseType.PLAIN;
    options.contentType = ContentType.parse("multipart/form-data");

    /// 创建dio对象
    Dio dio = new Dio(options);

    /// 创建一个formdata，作为dio的参数  其中：success_action_status需要设置为200，不然，默认会返回204
    FormData data = new FormData.from({
      'Filename': EnvInfo.bucket + '/' + fileName,
      'key': EnvInfo.fileDir + '/' + fileName,
      'policy': policy_base64,
      'OSSAccessKeyId': EnvInfo.accessKeyId,
      'success_action_status': '200',
      'signature': signature,
      'file': new UploadFileInfo(file, fileName),
    });

    Response response = await dio.post(EnvInfo.ossHost, data: data);
    print('上传文件请求成功了：${response.headers}');
    print('上传文件返回的内容：${response.data}');

    String urlSignature = genSignatureUrl(expireTime, EnvInfo.accessKeySecret,
        '/' + EnvInfo.bucket + '/' + EnvInfo.fileDir + '/' + fileName);
    print('urlSignature:${urlSignature}');
    String ossFileUrl = EnvInfo.ossHost +
        '/' +
        EnvInfo.fileDir +
        '/' +
        '${fileName}?OSSAccessKeyId=${EnvInfo.accessKeyId}&Expires=${expireTime.millisecondsSinceEpoch}&Signature=${urlSignature}';
    print('上传后url访问：${ossFileUrl}');
    result.value = ossFileUrl;
    return result;
  } catch (err) {
    print(err);
    return Result.genErrorMsg(AppErrMsg.REQUEST_ERROR);
  }
}

/// 获取oss-url的签名
String genSignatureUrl(
    DateTime expireTime, String accessKeySecret, String key) {
  String toSignString = "GET" +
      "\n" +
      "\n" +
      "\n" +
      expireTime.millisecondsSinceEpoch.toString() +
      "\n" +
      key;
  print('准备进行加密的数据：${toSignString}');

  /// 通过hmac,使用sha1进行加密
  var signature_pre = new Hmac(sha1, utf8.encode(accessKeySecret))
      .convert(utf8.encode(toSignString))
      .bytes;

  /// 最后一步，将上述所得进行base64 编码
  String signature = base64.encode(signature_pre);
  return Uri.encodeComponent(signature);
}
