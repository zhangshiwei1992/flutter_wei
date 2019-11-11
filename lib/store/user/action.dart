import 'package:flutter_wei/constants/app_err_msg.dart';
import 'package:flutter_wei/controller/common.dart';
import 'package:flutter_wei/model/Result.dart';
import 'package:flutter_wei/model/address.dart';
import 'package:flutter_wei/model/base.dart';
import 'package:flutter_wei/model/coupon.dart';
import 'package:flutter_wei/model/notice.dart';
import 'package:flutter_wei/model/user.dart';

import 'state.dart';

/// -----------------------------------------------------  查询用户信息 -----------------------------------------------------
/// 查询用户信息 - action
class QueryUserInfoAction {
  BaseDto requestDto;

  QueryUserInfoAction({
    this.requestDto,
  });
}

/// 查询用户信息 - action - function
UserState queryUserInfo(UserState state, QueryUserInfoAction action) {
  state.queryUserInfoResult = null;
  Future<Result> future =
      request('/user/queryUserInfo', action.requestDto.toJson());
  future.then((Result res) {
    print('res.value:${res.value}');
    state.queryUserInfoResult = Result(
        success: res.success,
        errorMsg: res.errorMsg,
        errorCode: res.errorCode,
        value: UserInfo.fromJson(res.value),
        extraInfo: res.extraInfo);
    ;
    state.queryUserInfoResult = Result.genErrorMsg(AppErrMsg.SYS_EXCEPTION);
  });
  return state;
}

/// -----------------------------------------------------  更新用户信息 -----------------------------------------------------
/// 更新用户信息 - action
class UpdateUserInfoAction {
  UserInfo user;

  UpdateUserInfoAction({
    this.user,
  });
}

/// 更新用户信息 - action - function
UserState updateUserInfo(UserState state, UpdateUserInfoAction action) {
  state.updateUserInfoResult = null;
  Future<Result> future = request('/user/updateInfo', action.user.toJson());
  future.then((Result res) {
    state.updateUserInfoResult = res;
  }).catchError((error) {
    state.updateUserInfoResult = Result.genErrorMsg(AppErrMsg.SYS_EXCEPTION);
  });
  return state;
}

/// -----------------------------------------------------  保存身份认证信息 -----------------------------------------------------
/// 保存身份认证信息 - action
class SaveUserCertInfoAction {
  Map userCertInfo;

  SaveUserCertInfoAction({
    this.userCertInfo,
  });
}

/// 保存身份认证信息 - action - function
UserState saveUserCertInfo(UserState state, SaveUserCertInfoAction action) {
  state.saveUserCertInfoResult = null;
  Future<Result> future =
      request('/userCertInfo/saveOrUpdate', action.userCertInfo);
  future.then((Result res) {
    state.saveUserCertInfoResult = res;
  }).catchError((error) {
    state.saveUserCertInfoResult = Result.genErrorMsg(AppErrMsg.SYS_EXCEPTION);
  });
  return state;
}

/// -----------------------------------------------------  查询用户优惠券信息 -----------------------------------------------------
/// 查询用户优惠券信息 - action
class QueryUserCouponInfoAction {
  BaseDto requestDto;

  QueryUserCouponInfoAction({
    this.requestDto,
  });
}

/// 查询用户优惠券信息 - action - function
UserState queryUserCouponInfo(
    UserState state, QueryUserCouponInfoAction action) {
  state.queryUserCouponInfoResult = null;
  Future<Result> future =
      request('/userCoupon/queryUserCouponInfo', action.requestDto.toJson());
  future.then((Result res) {
    List<Coupon> couponList =
        List<Coupon>.from(res.value.map((json) => Coupon.fromJson(json)));
    state.queryUserCouponInfoResult = Result(
      success: res.success,
      errorCode: res.errorCode,
      errorMsg: res.errorMsg,
      value: couponList,
      extraInfo: res.extraInfo,
    );
  }).catchError((error) {
    state.queryUserCouponInfoResult =
        Result.genErrorMsg(AppErrMsg.SYS_EXCEPTION);
  });
  return state;
}

/// -----------------------------------------------------  保存用户提交的反馈信息 -----------------------------------------------------
/// 保存用户提交的反馈信息 - action
class SaveFeedbackAction {
  Map requestDto;

  SaveFeedbackAction({
    this.requestDto,
  });
}

/// 保存用户提交的反馈信息 - action - function
UserState saveFeedback(UserState state, SaveFeedbackAction action) {
  state.saveFeedbackResult = null;
  Future<Result> future = request('/feedback/save', action.requestDto);
  future.then((Result res) {
    state.saveFeedbackResult = res;
  }).catchError((error) {
    state.saveFeedbackResult = Result.genErrorMsg(AppErrMsg.SYS_EXCEPTION);
  });
  return state;
}

/// -----------------------------------------------------  查询系统通知 -----------------------------------------------------
/// 查询系统通知 - action
class QueryNoticePageAction {
  Result<Notice> requestDto;

  QueryNoticePageAction({
    this.requestDto,
  });
}

/// 查询系统通知 - action - function
UserState queryNoticePage(UserState state, QueryNoticePageAction action) {
  state.queryNoticePageResult = null;
  Future<Result> future =
      request('/notice/queryNoticePage', action.requestDto.toJson());
  future.then((Result res) {
    List<Notice> list =
        List<Notice>.from(res.value.map((json) => Notice.fromJson(json)));
    state.queryNoticePageResult = Result(
      success: res.success,
      errorMsg: res.errorMsg,
      errorCode: res.errorCode,
      value: list,
      pageNum: res.pageNum,
      pageSize: res.pageSize,
      totalCount: res.totalCount,
    );
  }).catchError((error) {
    state.queryNoticePageResult =
        Result(success: false, errorMsg: AppErrMsg.SYS_EXCEPTION);
  });

  var resultJson = [
    {
      "noticeType": "1",
      "content":
          "您的订单14326989829424已收到，山姆采用实体店贱货模式，证根据订单需求，检查您是偶订购的商品状态是否有货。请留意短信邮件通知。",
      "generateTime": 1573183442000
    },
    {
      "noticeType": "2",
      "content":
          "您的订单14326989829424已收到，山姆采用实体店贱货模式，证根据订单需求，检查您是偶订购的商品状态是否有货。请留意短信邮件通知。",
      "generateTime": 1573182367000
    },
  ];
  List<Notice> noticeList =
      resultJson.map((json) => Notice.fromJson(json)).toList();

  state.queryNoticePageResult = Result(
      success: true,
      pageNum: 1,
      pageSize: 10,
      totalCount: 15,
      value: noticeList);
  return state;
}

/// -----------------------------------------------------  更新系统通知信息 -----------------------------------------------------
/// 更新系统通知信息 - action
class UpdateNoticeInfoAction {
  Notice requestDto;

  UpdateNoticeInfoAction({
    this.requestDto,
  });
}

/// 更新系统通知信息 - action - function
UserState updateNoticeInfo(UserState state, UpdateNoticeInfoAction action) {
  state.updateNoticeInfoResult = null;
  Future<Result> future =
      request('/notice/updateInfo', action.requestDto.toJson());
  future.then((Result res) {
    state.updateNoticeInfoResult = res;
  }).catchError((error) {
    state.updateNoticeInfoResult = Result.genErrorMsg(AppErrMsg.SYS_EXCEPTION);
  });
  return state;
}

/// -----------------------------------------------------  查询地址列表 -----------------------------------------------------
/// 查询地址列表 - action
class QueryUserAddressAction {
  BaseDto requestDto;

  QueryUserAddressAction({
    this.requestDto,
  });
}

/// 查询地址列表 - action - function
UserState queryUserAddress(UserState state, QueryUserAddressAction action) {
  state.queryUserAddressResult = null;
  Future<Result> future =
      request('/userAddress/findList', action.requestDto.toJson());
  future.then((Result res) {
    List<Address> list =
        List<Address>.from(res.value.map((json) => Address.fromJson(json)));
    state.queryUserAddressResult = Result(
      success: res.success,
      errorMsg: res.errorMsg,
      errorCode: res.errorCode,
      value: list,
      pageNum: res.pageNum,
      pageSize: res.pageSize,
      totalCount: res.totalCount,
    );
  }).catchError((error) {
    state.queryUserAddressResult =
        Result(success: false, errorMsg: AppErrMsg.SYS_EXCEPTION);
  });

  var resultJson = [
    {
      "id": 1,
      "receiverName": "许佳丽",
      "phoneNumber": '18621841989',
      "provinceCode": '江苏省',
      "cityCode": '南通市',
      "districtCode": '如皋市',
      "addressDetail": '搬经镇夏堡村9组20号',
      "isDefault": 'Y'
    },
    {
      "id": 2,
      "receiverName": "赵前",
      "phoneNumber": '18621841989',
      "provinceCode": '江苏省',
      "cityCode": '南通市',
      "districtCode": '如皋市',
      "addressDetail": '石家庄8村',
      "isDefault": 'N'
    },
  ];
  List<Address> result =
      resultJson.map((json) => Address.fromJson(json)).toList();
  state.queryUserAddressResult = Result(success: true, value: result);
  return state;
}
