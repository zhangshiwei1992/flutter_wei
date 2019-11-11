import 'package:flutter_wei/constants/sp_constant.dart';
import 'package:flutter_wei/utils/local_storage.dart';

/// 登录相关的判断方法
class LoginUtil {
  /// 判断是否登录
  static bool checkIsLogin() {
    var userId = LocalStorage.get(SpConstant.LOGIN_USER_ID);
    if (!userId) {
      return false;
    }
    return true;
  }
}
