class FileDetail {
  String businessCode;
  int channelId;
  String creator;
  String fileCode;
  String fileName;
  String filePath;
  int gmtCreated;
  int gmtModified;
  int id;
  String isCheck;
  String modifier;
  String subBusinessCode;
  String userId;

  FileDetail(
      {this.businessCode,
      this.channelId,
      this.creator,
      this.fileCode,
      this.fileName,
      this.filePath,
      this.gmtCreated,
      this.gmtModified,
      this.id,
      this.isCheck,
      this.modifier,
      this.subBusinessCode,
      this.userId});

  FileDetail.fromJson(Map<String, dynamic> json) {
    businessCode = json['businessCode'];
    channelId = json['channelId'];
    creator = json['creator'];
    fileCode = json['fileCode'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    gmtCreated = json['gmtCreated'];
    gmtModified = json['gmtModified'];
    id = json['id'];
    isCheck = json['isCheck'];
    modifier = json['modifier'];
    subBusinessCode = json['subBusinessCode'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessCode'] = this.businessCode;
    data['channelId'] = this.channelId;
    data['creator'] = this.creator;
    data['fileCode'] = this.fileCode;
    data['fileName'] = this.fileName;
    data['filePath'] = this.filePath;
    data['gmtCreated'] = this.gmtCreated;
    data['gmtModified'] = this.gmtModified;
    data['id'] = this.id;
    data['isCheck'] = this.isCheck;
    data['modifier'] = this.modifier;
    data['subBusinessCode'] = this.subBusinessCode;
    data['userId'] = this.userId;
    return data;
  }
}
