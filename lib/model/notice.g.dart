// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return Notice(
    id: json['id'] as int,
    userId: json['userId'] as String,
    noticeCode: json['noticeCode'] as String,
    noticeCategory: json['noticeCategory'] as String,
    noticeType: json['noticeType'] as String,
    content: json['content'] as String,
    status: json['status'] as String,
    generateTime: json['generateTime'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json['generateTime'] as int),
    dealTime: json['dealTime'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json['dealTime'] as int),
  );
}

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'noticeCode': instance.noticeCode,
      'noticeCategory': instance.noticeCategory,
      'noticeType': instance.noticeType,
      'content': instance.content,
      'status': instance.status,
      'generateTime': instance.generateTime?.toIso8601String(),
      'dealTime': instance.dealTime?.toIso8601String()
    };
