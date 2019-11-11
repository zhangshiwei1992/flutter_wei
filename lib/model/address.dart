import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  int id;
  String userId;
  String receiverName;
  String phoneRegion;
  String phoneNumber;
  String locationRegion;
  String provinceCode;
  String cityCode;
  String districtCode;
  String streetCode;
  String postCode;
  String addressDetail;
  String isDefault;

  Address({
    this.id,
    this.userId,
    this.receiverName,
    this.phoneRegion,
    this.phoneNumber,
    this.locationRegion,
    this.provinceCode,
    this.cityCode,
    this.districtCode,
    this.streetCode,
    this.postCode,
    this.addressDetail,
    this.isDefault,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address.empty();
}
