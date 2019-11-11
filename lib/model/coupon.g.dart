// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return Coupon(
      id: json['id'] as int,
      couponCode: json['couponCode'] as String,
      couponType: json['couponType'] as String,
      couponDesc: json['couponDesc'] as String,
      discount: (json['discount'] as num)?.toDouble(),
      channelId: json['channelId'] as int,
      userId: json['userId'] as String,
      startTime: json['startTime'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['startTime'] as int),
      endTime: json['endTime'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['endTime'] as int),
      status: json['status'] as String,
      ticketOutCode: json['ticketOutCode'] as String);
}

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'couponCode': instance.couponCode,
      'couponType': instance.couponType,
      'couponDesc': instance.couponDesc,
      'discount': instance.discount,
      'channelId': instance.channelId,
      'userId': instance.userId,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'status': instance.status,
      'ticketOutCode': instance.ticketOutCode
    };
