import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class UserAuth {
  int channelId;
  String userId;
  String authType;
  String authInfo;
  String authIcon;
  String authPath;
  String authStatus;
  String authStatusDesc;

  UserAuth({
    this.authInfo,
    this.authIcon,
    this.authPath,
    this.authType,
    this.authStatus,
    this.authStatusDesc,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) =>
      _$UserAuthFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthToJson(this);

  UserAuth.empty();
}
