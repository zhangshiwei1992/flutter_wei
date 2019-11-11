import 'package:dio/dio.dart';
import 'package:flutter_wei/model/Result.dart';

import '../config/EnvInfo_my.dart';

/// 通用的发送请求
Future<Result> dioPost(String path, var requestBody) async {
  print('post请求---开始啦 ' +
      EnvInfo_My.apiHost +
      path +
      " " +
      requestBody.toString());
  Result result = new Result();
  try {
    var response =
        await Dio().post(EnvInfo_My.apiHost + path, data: requestBody);
    print('dioPost 请求结果-result: ${response.data}');
    Map resultData = response.data;
    result = Result.fromJson(resultData);
    print('post请求-----------------------结束');
    return result;
  } catch (exception) {
    print(exception.toString());
    return Result();
  }
}
