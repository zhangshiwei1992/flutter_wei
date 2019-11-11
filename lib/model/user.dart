class UserInfo {
  String userName;
  String userId;
  String userType;
  String userTypeDesc;
  String avatar;
  String phoneNumber;
  String password;
  String gender;
  String validateCode;
  String sessionKey;
  String oldPassword;
  bool isEffective;

  UserInfo({
    this.userName,
    this.userId,
    this.userType,
    this.userTypeDesc,
    this.avatar,
    this.phoneNumber,
    this.password,
    this.gender,
    this.validateCode,
    this.sessionKey,
    this.oldPassword,
    this.isEffective,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    isEffective = json['isEffective'];
    userId = json['userId'];
    userType = json['userType'];
    userTypeDesc = json['userTypeDesc'];
    avatar = json['avatar'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    gender = json['gender'];
    validateCode = json['validateCode'];
    sessionKey = json['sessionKey'];
    oldPassword = json['oldPassword'];
    isEffective = json['isEffective'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isEffective'] = this.isEffective;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['userTypeDesc'] = this.userTypeDesc;
    data['avatar'] = this.avatar;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['validateCode'] = this.validateCode;
    data['sessionKey'] = this.sessionKey;
    data['oldPassword'] = this.oldPassword;
    data['isEffective'] = this.isEffective;
    return data;
  }

  UserInfo.empty();
}
