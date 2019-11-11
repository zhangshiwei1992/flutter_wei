import 'package:json_annotation/json_annotation.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon {
  int id;
  String couponCode;
  String couponType;
  String couponDesc;
  double discount;
  int channelId;
  String userId;
  DateTime startTime;
  DateTime endTime;
  String status;
  String ticketOutCode;

  Coupon({
    this.id,
    this.couponCode,
    this.couponType,
    this.couponDesc,
    this.discount,
    this.channelId,
    this.userId,
    this.startTime,
    this.endTime,
    this.status,
    this.ticketOutCode,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);

  Coupon.empty();
}
