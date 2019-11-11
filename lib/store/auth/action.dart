import 'package:flutter_wei/constants/app_err_msg.dart';
import 'package:flutter_wei/constants/sp_constant.dart';
import 'package:flutter_wei/controller/common.dart';
import 'package:flutter_wei/model/Result.dart';
import 'package:flutter_wei/model/auth.dart';
import 'package:flutter_wei/model/base.dart';
import 'package:flutter_wei/model/user.dart';
import 'package:flutter_wei/store/auth/state.dart';
import 'package:flutter_wei/utils/local_storage.dart';

/// -----------------------------------------------------  注册 -----------------------------------------------------
/// 注册的action
class RegisterAction {
  UserInfo user;

  RegisterAction({
    this.user,
  });
}

/// 注册action - function
AuthState register(AuthState state, RegisterAction action) {
  state.registerResult = null;
  Future<Result> future = request('/app/auth/register', action.user.toJson());
  future.then((Result res) {
    state.registerResult = Result(
      success: res.success,
      errorCode: res.errorCode,
      errorMsg: res.errorMsg,
      value: res.value,
      extraInfo: res.extraInfo,
    );
  }).catchError((error) {
    print('## register error: ${error}');
    state.registerResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
    );
  });
  return state;
}

/// -----------------------------------------------------  设置密码 -----------------------------------------------------
/// 注册的action
class SetPasswordAction {
  UserInfo user;

  SetPasswordAction({
    this.user,
  });
}

/// 注册action - function
AuthState setPassword(AuthState state, SetPasswordAction action) {
  state.setPasswordResult = null;
  Future<Result> future =
      request('/app/auth/setPassword', action.user.toJson());
  future.then((Result res) {
    state.setPasswordResult = Result(
      success: res.success,
      errorCode: res.errorCode,
      errorMsg: res.errorMsg,
      value: res.value,
      extraInfo: res.extraInfo,
    );
  }).catchError((error) {
    print('## setPassword error: ${error}');
    state.setPasswordResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
    );
  });
  return state;
}

/// -----------------------------------------------------  判断是否登录 -----------------------------------------------------
/// 判断是否登录 action
class CheckIsLoginAction {
  UserInfo user;

  CheckIsLoginAction({
    this.user,
  });
}

/// 判断是否登录 - action - function
AuthState checkIsLogin(AuthState state, CheckIsLoginAction action) {
  print('checkIsLogin action 进来了啊');
  state.checkIsLoginResult = null;
  Future future = LocalStorage.get(SpConstant.SESSION_KEY);
  future.then((sessionKey) {
    print('sessionKey = ${sessionKey}');
    if (null == sessionKey || sessionKey.isEmpty) {
      state.checkIsLoginResult = Result(success: true, value: false);
    } else {
      Future<Result> checkIsLoginFuture = request(
          '/app/auth/checkIsLogin',
          UserInfo(
            sessionKey: sessionKey,
          ).toJson());
      checkIsLoginFuture.then((Result res) {
        state.checkIsLoginResult = Result(
          success: res.success,
          errorCode: res.errorCode,
          errorMsg: res.errorMsg,
          value: res.value,
          extraInfo: res.extraInfo,
        );
      }).catchError((error) {
        state.checkIsLoginResult = Result(
          success: false,
          errorMsg: AppErrMsg.SYS_EXCEPTION,
          value: false,
        );
      });
    }
  }).catchError((error) {
    print('## checkIsLogin error: ${error}');
    state.checkIsLoginResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
      value: false,
    );
  });
  return state;
}

/// -----------------------------------------------------  检查用户是否注册  -----------------------------------------------------
/// 检查用户是否注册 - action
class CheckRegisterAction {
  UserInfo user;

  CheckRegisterAction({
    this.user,
  });
}

/// 检查用户是否注册 - action - function
AuthState checkIsRegister(AuthState state, CheckRegisterAction action) {
  state.checkIsRegisterResult = null;
  Future<Result> future =
      request('/app/auth/checkIsRegister', action.user.toJson());
  future.then((Result res) {
    print('res.value = ${res.value}');
    state.checkIsRegisterResult = res;
  }).catchError((error) {
    print('## checkRegister error: ${error}');
    state.checkIsRegisterResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
    );
  });
  return state;
}

/// -----------------------------------------------------  登录 -----------------------------------------------------
/// 登录 - action
class LoginAction {
  UserInfo user;

  LoginAction({
    this.user,
  });
}

/// 登录 - action - function
AuthState loginAction(AuthState state, LoginAction action) {
  state.loginResult = null;
  Future<Result> future = request('/app/auth/login', action.user.toJson());
  future.then((Result res) {
    print('res.value = ${res.value}');
    if (res.success) {
      state.loginResult = Result(
        success: res.success,
        errorCode: res.errorCode,
        errorMsg: res.errorMsg,
        value: UserInfo.fromJson(res.value),
        extraInfo: res.extraInfo,
      );
    } else {
      state.loginResult = Result(
        success: res.success,
        errorCode: res.errorCode,
        errorMsg: res.errorMsg,
        extraInfo: res.extraInfo,
      );
    }
  }).catchError((error) {
    print('## loginAction error: ${error}');
    state.loginResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
      value: UserInfo(),
    );
  });
  return state;
}

/// -----------------------------------------------------  修改密码 -----------------------------------------------------
/// 修改密码 - action
class ModifyPasswordAction {
  UserInfo user;

  ModifyPasswordAction({
    this.user,
  });
}

/// 修改密码 - action - function
AuthState modifyPassword(AuthState state, ModifyPasswordAction action) {
  state.modifyPasswordResult = null;
  Future<Result> future =
      request('/app/auth/resetPassword', action.user.toJson());
  future.then((Result res) {
    print('res.value = ${res.value}');
    state.modifyPasswordResult = res;
  }).catchError((error) {
    print('## modifyPassword error: ${error}');
    state.modifyPasswordResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
    );
  });
  return state;
}

/// -----------------------------------------------------  判断用户是否实名认证 -----------------------------------------------------
/// 判断用户是否实名认证 - action
class CheckUserIdAuthAction {
  UserAuth userAuth;

  CheckUserIdAuthAction({
    this.userAuth,
  });
}

/// 判断用户是否实名认证 - action - function
AuthState checkIdAuth(AuthState state, CheckUserIdAuthAction action) {
  state.checkIdAuthResult = null;
  Future<Result> future =
      request('/userAuth/checkAuth', action.userAuth.toJson());
  future.then((Result res) {
    print('## checkIdAuth res.value = ${res.value}');
    state.checkIdAuthResult = Result(
      success: res.success,
      errorCode: res.errorCode,
      errorMsg: res.errorMsg,
      value: res.value,
      extraInfo: res.extraInfo,
    );
  }).catchError((error) {
    print('## checkIdAuth error: ${error}');
    state.checkIdAuthResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
    );
  });
  return state;
}

/// -----------------------------------------------------  查询用户认证状态  -----------------------------------------------------
/// 判断用户是否实名认证 - action
class QueryUserAuthAction {
  BaseDto requestDto;

  QueryUserAuthAction({
    this.requestDto,
  });
}

/// 判断用户是否实名认证 - action - function
AuthState queryUserAuth(AuthState state, QueryUserAuthAction action) {
  state.queryUserAuthResult = null;
  Future<Result> future =
      request('/userAuth/queryUserAuthInfo', action.requestDto.toJson());
  future.then((Result res) {
    print('res.value = ${res.value}');
    List<UserAuth> userAuthList =
        List<UserAuth>.from(res.value.map((json) => UserAuth.fromJson(json)));
    state.queryUserAuthResult = Result(
      success: res.success,
      errorCode: res.errorCode,
      errorMsg: res.errorMsg,
      value: userAuthList,
      extraInfo: res.extraInfo,
    );
  }).catchError((error) {
    print('## checkIdAuth error: ${error}');
    state.queryUserAuthResult = Result(
      success: false,
      errorMsg: AppErrMsg.SYS_EXCEPTION,
    );
  });
  return state;
}
