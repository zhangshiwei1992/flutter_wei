import 'package:flutter_wei/model/Result.dart';
import 'package:flutter_wei/model/auth.dart';
import 'package:flutter_wei/model/user.dart';

/// 授权相关的状态
class AuthState {
  /// 登录用户成功结果
  Result<UserInfo> loginResult;

  /// 检查用户是否注册
  Result checkIsRegisterResult;

  /// 注册结果
  Result registerResult;

  /// 设置密码
  Result setPasswordResult;

  /// 修改密码
  Result modifyPasswordResult;

  /// 是否登录
  Result<bool> checkIsLoginResult;

  /// 检查是否身份认证
  Result<bool> checkIdAuthResult;

  /// 查询用户认证结果
  Result<List<UserAuth>> queryUserAuthResult;

  AuthState({
    this.loginResult,
    this.registerResult,
    this.setPasswordResult,
    this.modifyPasswordResult,
    this.checkIsLoginResult,
    this.checkIsRegisterResult,
    this.checkIdAuthResult,
    this.queryUserAuthResult,
  });

  AuthState.empty();
}
