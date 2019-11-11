import 'package:flutter_wei/model/Result.dart';
import 'package:flutter_wei/model/address.dart';
import 'package:flutter_wei/model/notice.dart';
import 'package:flutter_wei/model/user.dart';

class UserState {
  /// 查询用户基本信息
  Result<UserInfo> queryUserInfoResult;

  /// 更新用户信息结果
  Result updateUserInfoResult;

  /// 保存用户身份认证信息结果
  Result saveUserCertInfoResult;

  /// 查询用户优惠券结果
  Result queryUserCouponInfoResult;

  /// 保存反馈意见
  Result saveFeedbackResult;

  /// 查询所有系统通知结果
  Result<List<Notice>> queryNoticePageResult;

  /// 更新系统通知的状态结果
  Result updateNoticeInfoResult;

  /// 查询系统通知的数量
  Result<int> queryNoticeCountResult;

  /// 查询用户的地址列表结果
  Result<List<Address>> queryUserAddressResult;

  UserState({
    this.queryUserInfoResult,
    this.updateUserInfoResult,
    this.saveUserCertInfoResult,
    this.queryUserCouponInfoResult,
    this.saveFeedbackResult,
    this.queryNoticePageResult,
    this.updateNoticeInfoResult,
    this.queryNoticeCountResult,
    this.queryUserAddressResult,
  });

  UserState.empty();
}
