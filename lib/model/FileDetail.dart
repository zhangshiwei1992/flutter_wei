class FileDetail {
  String businessCode;
  Object channelId;
  String creator;
  String fileCode;
  String fileName;
  String filePath;
  Object fileId;
  Object id;
  String isCheck;
  String modifier;
  String subBusinessCode;
  String userId;

  FileDetail({
    this.businessCode,
    this.channelId,
    this.creator,
    this.fileCode,
    this.fileName,
    this.filePath,
    this.id,
    this.fileId,
    this.isCheck,
    this.modifier,
    this.subBusinessCode,
    this.userId,
  });

  FileDetail.fromJson(Map<String, dynamic> json) {
    businessCode = json['businessCode'];
    channelId = json['channelId'];
    creator = json['creator'];
    fileCode = json['fileCode'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    id = json['id'];
    fileId = json['fileId'];
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
    data['id'] = this.id;
    data['fileId'] = this.fileId;
    data['isCheck'] = this.isCheck;
    data['modifier'] = this.modifier;
    data['subBusinessCode'] = this.subBusinessCode;
    data['userId'] = this.userId;
    return data;
  }
}
