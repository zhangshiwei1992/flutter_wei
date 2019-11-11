class BaseDto {
  int channelId;
  String userId;

  BaseDto({
    this.channelId,
    this.userId,
  });

  BaseDto.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelId'] = this.channelId;
    data['userId'] = this.userId;
    return data;
  }

  BaseDto.empty();
}
