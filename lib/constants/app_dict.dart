import 'package:flutter_wei/model/dict.dart';

/// App中通用的一些字典表集合
/// 获取性别的字典表
List<DictCode> genGenderDict() {
  var resultJson = [
    {
      'code': 'F',
      'name': '女',
    },
    {
      'code': 'M',
      'name': '男',
    },
  ];
  List<DictCode> result =
      resultJson.map((json) => DictCode.fromJson(json)).toList();
  return result;
}
