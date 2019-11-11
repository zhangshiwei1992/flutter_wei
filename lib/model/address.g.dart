// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
      id: json['id'] as int,
      userId: json['userId'] as String,
      receiverName: json['receiverName'] as String,
      phoneRegion: json['phoneRegion'] as String,
      phoneNumber: json['phoneNumber'] as String,
      locationRegion: json['locationRegion'] as String,
      provinceCode: json['provinceCode'] as String,
      cityCode: json['cityCode'] as String,
      districtCode: json['districtCode'] as String,
      streetCode: json['streetCode'] as String,
      postCode: json['postCode'] as String,
      addressDetail: json['addressDetail'] as String,
      isDefault: json['isDefault'] as String);
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'receiverName': instance.receiverName,
      'phoneRegion': instance.phoneRegion,
      'phoneNumber': instance.phoneNumber,
      'locationRegion': instance.locationRegion,
      'provinceCode': instance.provinceCode,
      'cityCode': instance.cityCode,
      'districtCode': instance.districtCode,
      'streetCode': instance.streetCode,
      'postCode': instance.postCode,
      'addressDetail': instance.addressDetail,
      'isDefault': instance.isDefault
    };
