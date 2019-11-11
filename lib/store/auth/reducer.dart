import 'package:redux/redux.dart';

import 'action.dart';
import 'state.dart';

/// 这里combineReducers的作用是把action和函数绑定起来，
/// 免去了写例如if (action is IncreaseAction)之类的判断语句。
/// 对应的action执行对应的函数。
final AuthReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, RegisterAction>(register),
  TypedReducer<AuthState, SetPasswordAction>(setPassword),
  TypedReducer<AuthState, CheckIsLoginAction>(checkIsLogin),
  TypedReducer<AuthState, CheckRegisterAction>(checkIsRegister),
  TypedReducer<AuthState, LoginAction>(loginAction),
  TypedReducer<AuthState, ModifyPasswordAction>(modifyPassword),
  TypedReducer<AuthState, CheckUserIdAuthAction>(checkIdAuth),
  TypedReducer<AuthState, QueryUserAuthAction>(queryUserAuth),
]);
