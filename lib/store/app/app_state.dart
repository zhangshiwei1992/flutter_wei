import 'package:flutter_wei/store/auth/reducer.dart';
import 'package:flutter_wei/store/auth/state.dart';
import 'package:flutter_wei/store/user/reducer.dart';
import 'package:flutter_wei/store/user/state.dart';

class AppState {
  AuthState authState;
  UserState userState;

  AppState({
    this.authState,
    this.userState,
  });

  // 初始化数据信息
  factory AppState.initState() {
    return new AppState(
      authState: AuthState.empty(),
      userState: UserState.empty(),
    );
  }
}

/// App的state中不同的模块各自处理，最终绑定到AppState reducer中
AppState appReducer(AppState state, dynamic action) {
  print("state charge :$action ");
  return AppState(
    authState: AuthReducer(state.authState, action),
    userState: UserReducer(state.userState, action),
  );
}
