import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';

@JsonSerializable()
class Notice {
  int id;
  String userId;
  String noticeCode;
  String noticeCategory;
  String noticeType;
  String content;
  String status;
  DateTime generateTime;
  DateTime dealTime;

  Notice({
    this.id,
    this.userId,
    this.noticeCode,
    this.noticeCategory,
    this.noticeType,
    this.content,
    this.status,
    this.generateTime,
    this.dealTime,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);

  Notice.empty();
}
