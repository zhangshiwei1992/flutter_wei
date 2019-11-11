import 'package:flutter_wei/model/dict.dart';

/// map相关通用方法
class MapUtil {
  /// 根据键值获取key对应的值
  static String getValue(Map<String, dynamic> map, String key) {
    String result = "";
    if (null != map) {
      if (map.containsKey(key)) {
        map.forEach((String eachKey, dynamic value) {
          if (key == eachKey) {
            result = value;
            return;
          }
        });
      }
    }
    return result;
  }

  /// 根据键值获取key对应的值 --- value 的类型是 List<DictCode>
  static List<DictCode> getList(Map<String, dynamic> map, String key) {
    List<DictCode> result = null;
    if (null != map) {
      if (map.containsKey(key)) {
        map.forEach((String eachKey, dynamic value) {
          if (key == eachKey && null != value) {
            result = value;
            return;
          }
        });
      }
    }
    return result;
  }

  /// 根据键值获取key对应的值 --- value 的类型是 Map<String, dynamic>
  static List<DictCode> getListByMap(Map<String, dynamic> map, String key) {
    List<DictCode> result = null;
    if (null != map) {
      if (map.containsKey(key)) {
        map.forEach((String eachKey, dynamic value) {
          if (key == eachKey && null != value) {
            result = List<DictCode>.from(
                value.map((json) => DictCode.fromJson(json)));
            return;
          }
        });
      }
    }
    return result;
  }
}
