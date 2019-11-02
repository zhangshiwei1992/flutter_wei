class Result<T> {
  bool success;
  T value;
  String errorCode;
  String errorMsg;
  Map<String, Object> extraInfo;

  Result({
    this.success,
    this.value,
    this.errorCode,
    this.errorMsg,
    this.extraInfo,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      success: json['success'],
      value: json['value'],
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
      extraInfo: json['extraInfo'],
    );
  }
}
