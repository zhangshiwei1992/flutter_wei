import 'package:dio/dio.dart';

import '../config/EnvInfo.dart';
import '../constants/Result.dart';

/// 通用的发送请求
Future<Result> dioPost(String path, var requestBody) async {
  print('post请求-----------------------开始啦' + requestBody.toString());
  Result result = new Result();
  try {
    var response = await Dio().post(EnvInfo.apiHost + path, data: requestBody);
    print('request result: ${response.data}');
    Map resultData = response.data;
    result = Result.fromJson(resultData);
    print('post请求-----------------------结束');
    return result;
  } catch (exception) {
    print(exception.toString());
    return Result();
  }
}
