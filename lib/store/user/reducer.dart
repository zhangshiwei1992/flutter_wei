import 'package:redux/redux.dart';

import 'action.dart';
import 'state.dart';

/// 这里combineReducers的作用是把action和函数绑定起来，
/// 免去了写例如if (action is IncreaseAction)之类的判断语句。
/// 对应的action执行对应的函数。
final UserReducer = combineReducers<UserState>([
  TypedReducer<UserState, QueryUserInfoAction>(queryUserInfo),
  TypedReducer<UserState, UpdateUserInfoAction>(updateUserInfo),
  TypedReducer<UserState, SaveUserCertInfoAction>(saveUserCertInfo),
  TypedReducer<UserState, QueryUserCouponInfoAction>(queryUserCouponInfo),
  TypedReducer<UserState, SaveFeedbackAction>(saveFeedback),
  TypedReducer<UserState, QueryNoticePageAction>(queryNoticePage),
  TypedReducer<UserState, UpdateNoticeInfoAction>(updateNoticeInfo),
  TypedReducer<UserState, QueryUserAddressAction>(queryUserAddress),
]);
