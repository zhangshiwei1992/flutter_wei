class VehicleBrand {
  String apiProductCode;
  String creator;
  String fullName;
  int id;
  String initial;
  String isDeleted;
  String logo;
  String modifier;
  String name;
  int openApiId;
  String status;

  VehicleBrand(
      {this.apiProductCode,
      this.creator,
      this.fullName,
      this.id,
      this.initial,
      this.isDeleted,
      this.logo,
      this.modifier,
      this.name,
      this.openApiId,
      this.status});

  VehicleBrand.fromJson(Map<String, dynamic> json) {
    apiProductCode = json['apiProductCode'];
    creator = json['creator'];
    fullName = json['fullName'];
    id = json['id'];
    initial = json['initial'];
    isDeleted = json['isDeleted'];
    logo = json['logo'];
    modifier = json['modifier'];
    name = json['name'];
    openApiId = json['openApiId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiProductCode'] = this.apiProductCode;
    data['creator'] = this.creator;
    data['fullName'] = this.fullName;
    data['id'] = this.id;
    data['initial'] = this.initial;
    data['isDeleted'] = this.isDeleted;
    data['logo'] = this.logo;
    data['modifier'] = this.modifier;
    data['name'] = this.name;
    data['openApiId'] = this.openApiId;
    data['status'] = this.status;
    return data;
  }
}
