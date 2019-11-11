// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuth _$UserAuthFromJson(Map<String, dynamic> json) {
  return UserAuth(
      authInfo: json['authInfo'] as String,
      authIcon: json['authIcon'] as String,
      authPath: json['authPath'] as String,
      authType: json['authType'] as String,
      authStatus: json['authStatus'] as String,
      authStatusDesc: json['authStatusDesc'] as String)
    ..channelId = json['channelId'] as int
    ..userId = json['userId'] as String;
}

Map<String, dynamic> _$UserAuthToJson(UserAuth instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'userId': instance.userId,
      'authType': instance.authType,
      'authInfo': instance.authInfo,
      'authIcon': instance.authIcon,
      'authPath': instance.authPath,
      'authStatus': instance.authStatus,
      'authStatusDesc': instance.authStatusDesc
    };
