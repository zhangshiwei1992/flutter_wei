class Vehicle {
  double taxPoint;
  String engineCode;
  String licenseProperty;
  int subletSalePrice;
  int gmtCreated;
  String modifier;
  String inStoreBy;
  String invoiceAmount;
  int renewalNum;
  int purchasePrice;
  String sourceCode;
  String carNo;
  String fixPaymentPayFlag;
  String gpsStatus;
  int id;
  String bizStatus;
  String vehicleTypeName;
  String vehicleBrandName;
  String vehicleCode;
  String licenseProvinceCode;
  String invoiceCode;
  String invoiceTaxRate;
  String licenseAreaAbbr;
  String updateAnnualReviewDate;
  int purchaserDetailId;
  String corganCode;
  String sourceType;
  String licenseStatus;
  String guidePrice;
  String status;
  int vehicleSeriesId;
  int gmtModified;
  int vehicleTypeId;
  String vehicleVendorName;
  int vehicleVendorId;
  String certificatesInStoreBy;
  int outAnnualReviewDate;
  int subletAssessPrice;
  int wirelessNum;
  String annualReviewStatus;
  String vehicleSeriesName;
  String licenseDistrictCode;
  int vehiclePrice;
  String vinCode;
  String isDeleted;
  int nextAnnualReviewDate;
  String wiredPeriod;
  int vehicleBrandId;
  String licenseNumber;
  int expensePrice;
  String finalPaymentPayFlag;
  String vehicleColor;
  int certificatesInStoreTime;
  String certificateCode;
  String creator;
  int wiredNum;
  String licenseAlpha;
  String vehicleProperty;
  String organName;
  String orderCode;
  String wirelessPeriod;
  String licenseCityCode;
  int gmtDriving;
  String licenseUseProperty;

  Vehicle({
    this.taxPoint,
    this.engineCode,
    this.licenseProperty,
    this.subletSalePrice,
    this.gmtCreated,
    this.modifier,
    this.inStoreBy,
    this.invoiceAmount,
    this.renewalNum,
    this.purchasePrice,
    this.sourceCode,
    this.carNo,
    this.fixPaymentPayFlag,
    this.gpsStatus,
    this.id,
    this.bizStatus,
    this.vehicleTypeName,
    this.vehicleBrandName,
    this.vehicleCode,
    this.licenseProvinceCode,
    this.invoiceCode,
    this.invoiceTaxRate,
    this.licenseAreaAbbr,
    this.updateAnnualReviewDate,
    this.purchaserDetailId,
    this.corganCode,
    this.sourceType,
    this.licenseStatus,
    this.guidePrice,
    this.status,
    this.vehicleSeriesId,
    this.gmtModified,
    this.vehicleTypeId,
    this.vehicleVendorName,
    this.vehicleVendorId,
    this.certificatesInStoreBy,
    this.outAnnualReviewDate,
    this.subletAssessPrice,
    this.wirelessNum,
    this.annualReviewStatus,
    this.vehicleSeriesName,
    this.licenseDistrictCode,
    this.vehiclePrice,
    this.vinCode,
    this.isDeleted,
    this.nextAnnualReviewDate,
    this.wiredPeriod,
    this.vehicleBrandId,
    this.licenseNumber,
    this.expensePrice,
    this.finalPaymentPayFlag,
    this.vehicleColor,
    this.certificatesInStoreTime,
    this.certificateCode,
    this.creator,
    this.wiredNum,
    this.licenseAlpha,
    this.vehicleProperty,
    this.organName,
    this.orderCode,
    this.wirelessPeriod,
    this.licenseCityCode,
    this.gmtDriving,
    this.licenseUseProperty,
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    taxPoint = json['taxPoint'];
    engineCode = json['engineCode'];
    licenseProperty = json['licenseProperty'];
    subletSalePrice = json['subletSalePrice'];
    gmtCreated = json['gmtCreated'];
    modifier = json['modifier'];
    inStoreBy = json['inStoreBy'];
    invoiceAmount = json['invoiceAmount'];
    renewalNum = json['renewalNum'];
    purchasePrice = json['purchasePrice'];
    sourceCode = json['sourceCode'];
    carNo = json['carNo'];
    fixPaymentPayFlag = json['fixPaymentPayFlag'];
    gpsStatus = json['gpsStatus'];
    id = json['id'];
    bizStatus = json['bizStatus'];
    vehicleTypeName = json['vehicleTypeName'];
    vehicleBrandName = json['vehicleBrandName'];
    vehicleCode = json['vehicleCode'];
    licenseProvinceCode = json['licenseProvinceCode'];
    invoiceCode = json['invoiceCode'];
    invoiceTaxRate = json['invoiceTaxRate'];
    licenseAreaAbbr = json['licenseAreaAbbr'];
    updateAnnualReviewDate = json['updateAnnualReviewDate'];
    purchaserDetailId = json['purchaserDetailId'];
    corganCode = json['corganCode'];
    sourceType = json['sourceType'];
    licenseStatus = json['licenseStatus'];
    guidePrice = json['guidePrice'];
    status = json['status'];
    vehicleSeriesId = json['vehicleSeriesId'];
    gmtModified = json['gmtModified'];
    vehicleTypeId = json['vehicleTypeId'];
    vehicleVendorName = json['vehicleVendorName'];
    vehicleVendorId = json['vehicleVendorId'];
    certificatesInStoreBy = json['certificatesInStoreBy'];
    outAnnualReviewDate = json['outAnnualReviewDate'];
    subletAssessPrice = json['subletAssessPrice'];
    wirelessNum = json['wirelessNum'];
    annualReviewStatus = json['annualReviewStatus'];
    vehicleSeriesName = json['vehicleSeriesName'];
    licenseDistrictCode = json['licenseDistrictCode'];
    vehiclePrice = json['vehiclePrice'];
    vinCode = json['vinCode'];
    isDeleted = json['isDeleted'];
    nextAnnualReviewDate = json['nextAnnualReviewDate'];
    wiredPeriod = json['wiredPeriod'];
    vehicleBrandId = json['vehicleBrandId'];
    licenseNumber = json['licenseNumber'];
    expensePrice = json['expensePrice'];
    finalPaymentPayFlag = json['finalPaymentPayFlag'];
    vehicleColor = json['vehicleColor'];
    certificatesInStoreTime = json['certificatesInStoreTime'];
    certificateCode = json['certificateCode'];
    creator = json['creator'];
    wiredNum = json['wiredNum'];
    licenseAlpha = json['licenseAlpha'];
    vehicleProperty = json['vehicleProperty'];
    organName = json['organName'];
    orderCode = json['orderCode'];
    wirelessPeriod = json['wirelessPeriod'];
    licenseCityCode = json['licenseCityCode'];
    gmtDriving = json['gmtDriving'];
    licenseUseProperty = json['licenseUseProperty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxPoint'] = this.taxPoint;
    data['engineCode'] = this.engineCode;
    data['licenseProperty'] = this.licenseProperty;
    data['subletSalePrice'] = this.subletSalePrice;
    data['gmtCreated'] = this.gmtCreated;
    data['modifier'] = this.modifier;
    data['inStoreBy'] = this.inStoreBy;
    data['invoiceAmount'] = this.invoiceAmount;
    data['renewalNum'] = this.renewalNum;
    data['purchasePrice'] = this.purchasePrice;
    data['sourceCode'] = this.sourceCode;
    data['carNo'] = this.carNo;
    data['fixPaymentPayFlag'] = this.fixPaymentPayFlag;
    data['gpsStatus'] = this.gpsStatus;
    data['id'] = this.id;
    data['bizStatus'] = this.bizStatus;
    data['vehicleTypeName'] = this.vehicleTypeName;
    data['vehicleBrandName'] = this.vehicleBrandName;
    data['vehicleCode'] = this.vehicleCode;
    data['licenseProvinceCode'] = this.licenseProvinceCode;
    data['invoiceCode'] = this.invoiceCode;
    data['invoiceTaxRate'] = this.invoiceTaxRate;
    data['licenseAreaAbbr'] = this.licenseAreaAbbr;
    data['updateAnnualReviewDate'] = this.updateAnnualReviewDate;
    data['purchaserDetailId'] = this.purchaserDetailId;
    data['corganCode'] = this.corganCode;
    data['sourceType'] = this.sourceType;
    data['licenseStatus'] = this.licenseStatus;
    data['guidePrice'] = this.guidePrice;
    data['status'] = this.status;
    data['vehicleSeriesId'] = this.vehicleSeriesId;
    data['gmtModified'] = this.gmtModified;
    data['vehicleTypeId'] = this.vehicleTypeId;
    data['vehicleVendorName'] = this.vehicleVendorName;
    data['vehicleVendorId'] = this.vehicleVendorId;
    data['certificatesInStoreBy'] = this.certificatesInStoreBy;
    data['outAnnualReviewDate'] = this.outAnnualReviewDate;
    data['subletAssessPrice'] = this.subletAssessPrice;
    data['wirelessNum'] = this.wirelessNum;
    data['annualReviewStatus'] = this.annualReviewStatus;
    data['vehicleSeriesName'] = this.vehicleSeriesName;
    data['licenseDistrictCode'] = this.licenseDistrictCode;
    data['vehiclePrice'] = this.vehiclePrice;
    data['vinCode'] = this.vinCode;
    data['isDeleted'] = this.isDeleted;
    data['nextAnnualReviewDate'] = this.nextAnnualReviewDate;
    data['wiredPeriod'] = this.wiredPeriod;
    data['vehicleBrandId'] = this.vehicleBrandId;
    data['licenseNumber'] = this.licenseNumber;
    data['expensePrice'] = this.expensePrice;
    data['finalPaymentPayFlag'] = this.finalPaymentPayFlag;
    data['vehicleColor'] = this.vehicleColor;
    data['certificatesInStoreTime'] = this.certificatesInStoreTime;
    data['certificateCode'] = this.certificateCode;
    data['creator'] = this.creator;
    data['wiredNum'] = this.wiredNum;
    data['licenseAlpha'] = this.licenseAlpha;
    data['vehicleProperty'] = this.vehicleProperty;
    data['organName'] = this.organName;
    data['orderCode'] = this.orderCode;
    data['wirelessPeriod'] = this.wirelessPeriod;
    data['licenseCityCode'] = this.licenseCityCode;
    data['gmtDriving'] = this.gmtDriving;
    data['licenseUseProperty'] = this.licenseUseProperty;
    return data;
  }
}
