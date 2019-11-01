class CapitalDetail {
  String creator;
  String side;
  String modifier;
  String canUpload;
  String capitalCode;
  String billFlag;
  String capitalName;
  String isDeleted;
  String needGenBill;
  Object overdueGracePeriod;
  Object id;

  CapitalDetail({
    this.creator,
    this.side,
    this.modifier,
    this.canUpload,
    this.capitalCode,
    this.billFlag,
    this.capitalName,
    this.isDeleted,
    this.needGenBill,
    this.overdueGracePeriod,
    this.id,
  });

  CapitalDetail.fromJson(Map<String, dynamic> json) {
    creator = json['creator'];
    side = json['side'];
    modifier = json['modifier'];
    canUpload = json['canUpload'];
    capitalCode = json['capitalCode'];
    billFlag = json['billFlag'];
    capitalName = json['capitalName'];
    isDeleted = json['isDeleted'];
    needGenBill = json['needGenBill'];
    overdueGracePeriod = json['overdueGracePeriod'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creator'] = this.creator;
    data['side'] = this.side;
    data['modifier'] = this.modifier;
    data['canUpload'] = this.canUpload;
    data['capitalCode'] = this.capitalCode;
    data['billFlag'] = this.billFlag;
    data['capitalName'] = this.capitalName;
    data['isDeleted'] = this.isDeleted;
    data['needGenBill'] = this.needGenBill;
    data['overdueGracePeriod'] = this.overdueGracePeriod;
    data['id'] = this.id;
    return data;
  }
}
