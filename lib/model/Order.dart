class Order {
  String orderType;
  Object commonInsuranceAmt;
  Object remaindIllegalDeposit;
  Object subletTotalPrice;
  Object fixPayment;
  Object subletInsurancePrice;
  String accidentInsuranceStatus;
  Object remaindDownPayment;
  String type;
  String insuranceReturnType;
  Object downPayment;
  Object id;
  Object applyTime;
  Object businessInsuranceAmount;
  String deliveryRemark;
  Object period;
  String perpaymentType;
  String licenseProvinceCode;
  Object unpaidFixPayment;
  String isDepositRefund;
  Object remaindCommonInsuranceAmt;
  Object submitTime;
  Object trafficInsuranceAmount;
  String corganCode;
  Object unpaidDownInsurancePayment;
  Object downInsurancePaymentTime;
  String status;
  Object vehicleSeriesId;
  Object gmtModified;
  Object vehicleTypeId;
  String submitBy;
  Object oilchangegasAmt;
  String useType;
  Object subletExcitationFee;
  String isDeleted;
  Object purchaseTax;
  String hasGuarantor;
  String handVehicleBy;
  Object subletOtherFee;
  Object vehicleBrandId;
  Object approveTime;
  String capitalSide;
  String downInsurancePaymentBy;
  Object subletRemainderInsuranceFee;
  Object channelId;
  String creator;
  String side;
  Object salePrice;
  String productProperty;
  Object balanceAmount;
  Object subletPreparationFee;
  String userId;
  Object loanAmount;
  Object carLicenseAmt;
  Object paidDownInsurancePayment;
  String productCode;
  String packageCode;
  Object accidentInsuranceAmount;
  String approveBy;
  Object subletSalePrice;
  Object gmtCreated;
  String modifier;
  String saler;
  Object remaindRenewalDeposit;
  Object illegalDeposit;
  String insuranceProperty;
  Object perPayment;
  Object realAccidentInsuranceAmount;
  Object accidentFee;
  String earlyDebtTransfer;
  Object gpsAmt;
  Object actualRate;
  Object otherAmt;
  String vehicleCode;
  Object remaindInsuranceAmt;
  Object remaindOilchangegasAmt;
  Object insuranceAmt;
  Object downInsurancePayment;
  Object totalAmt;
  Object subletGpsPrice;
  String deliverConfirmBy;
  Object unpaidFinalPayment;
  String salerPhone;
  Object vehicleVendorId;
  Object subletCertHandleFee;
  Object subletAssessPrice;
  Object deliverConfirmTime;
  String remark;
  Object remaindRedeemAmt;
  Object times;
  String contractApplyRemark;
  Object finalPayment;
  Object redeemAmt;
  Object paidFinalPayment;
  String applyBy;
  String vehicleColor;
  Object capitalRate;
  String billCalcType;
  Object nextYearInsuranceFee;
  String vehicleProperty;
  Object remaindNextYearInsuranceFee;
  Object accelerateDepreciationFee;
  Object renewalDeposit;
  Object handVehicleTime;
  Object paidFixPayment;
  String orderCode;
  String licenseCityCode;
  Object remaindAccelerateDepreciationFee;

  Order({
    this.orderType,
    this.commonInsuranceAmt,
    this.remaindIllegalDeposit,
    this.subletTotalPrice,
    this.fixPayment,
    this.subletInsurancePrice,
    this.accidentInsuranceStatus,
    this.remaindDownPayment,
    this.type,
    this.insuranceReturnType,
    this.downPayment,
    this.id,
    this.applyTime,
    this.businessInsuranceAmount,
    this.deliveryRemark,
    this.period,
    this.perpaymentType,
    this.licenseProvinceCode,
    this.unpaidFixPayment,
    this.isDepositRefund,
    this.remaindCommonInsuranceAmt,
    this.submitTime,
    this.trafficInsuranceAmount,
    this.corganCode,
    this.unpaidDownInsurancePayment,
    this.downInsurancePaymentTime,
    this.status,
    this.vehicleSeriesId,
    this.gmtModified,
    this.vehicleTypeId,
    this.submitBy,
    this.oilchangegasAmt,
    this.useType,
    this.subletExcitationFee,
    this.isDeleted,
    this.purchaseTax,
    this.hasGuarantor,
    this.handVehicleBy,
    this.subletOtherFee,
    this.vehicleBrandId,
    this.approveTime,
    this.capitalSide,
    this.downInsurancePaymentBy,
    this.subletRemainderInsuranceFee,
    this.channelId,
    this.creator,
    this.side,
    this.salePrice,
    this.productProperty,
    this.balanceAmount,
    this.subletPreparationFee,
    this.userId,
    this.loanAmount,
    this.carLicenseAmt,
    this.paidDownInsurancePayment,
    this.productCode,
    this.packageCode,
    this.accidentInsuranceAmount,
    this.approveBy,
    this.subletSalePrice,
    this.gmtCreated,
    this.modifier,
    this.saler,
    this.remaindRenewalDeposit,
    this.illegalDeposit,
    this.insuranceProperty,
    this.perPayment,
    this.realAccidentInsuranceAmount,
    this.accidentFee,
    this.earlyDebtTransfer,
    this.gpsAmt,
    this.actualRate,
    this.otherAmt,
    this.vehicleCode,
    this.remaindInsuranceAmt,
    this.remaindOilchangegasAmt,
    this.insuranceAmt,
    this.downInsurancePayment,
    this.totalAmt,
    this.subletGpsPrice,
    this.deliverConfirmBy,
    this.unpaidFinalPayment,
    this.salerPhone,
    this.vehicleVendorId,
    this.subletCertHandleFee,
    this.subletAssessPrice,
    this.deliverConfirmTime,
    this.remark,
    this.remaindRedeemAmt,
    this.times,
    this.contractApplyRemark,
    this.finalPayment,
    this.redeemAmt,
    this.paidFinalPayment,
    this.applyBy,
    this.vehicleColor,
    this.capitalRate,
    this.billCalcType,
    this.nextYearInsuranceFee,
    this.vehicleProperty,
    this.remaindNextYearInsuranceFee,
    this.accelerateDepreciationFee,
    this.renewalDeposit,
    this.handVehicleTime,
    this.paidFixPayment,
    this.orderCode,
    this.licenseCityCode,
    this.remaindAccelerateDepreciationFee,
  });

  Order.fromJson(Map<String, dynamic> json) {
    orderType = json['orderType'];
    commonInsuranceAmt = json['commonInsuranceAmt'];
    remaindIllegalDeposit = json['remaindIllegalDeposit'];
    subletTotalPrice = json['subletTotalPrice'];
    fixPayment = json['fixPayment'];
    subletInsurancePrice = json['subletInsurancePrice'];
    accidentInsuranceStatus = json['accidentInsuranceStatus'];
    remaindDownPayment = json['remaindDownPayment'];
    type = json['type'];
    insuranceReturnType = json['insuranceReturnType'];
    downPayment = json['downPayment'];
    id = json['id'];
    applyTime = json['applyTime'];
    businessInsuranceAmount = json['businessInsuranceAmount'];
    deliveryRemark = json['deliveryRemark'];
    period = json['period'];
    perpaymentType = json['perpaymentType'];
    licenseProvinceCode = json['licenseProvinceCode'];
    unpaidFixPayment = json['unpaidFixPayment'];
    isDepositRefund = json['isDepositRefund'];
    remaindCommonInsuranceAmt = json['remaindCommonInsuranceAmt'];
    submitTime = json['submitTime'];
    trafficInsuranceAmount = json['trafficInsuranceAmount'];
    corganCode = json['corganCode'];
    unpaidDownInsurancePayment = json['unpaidDownInsurancePayment'];
    downInsurancePaymentTime = json['downInsurancePaymentTime'];
    status = json['status'];
    vehicleSeriesId = json['vehicleSeriesId'];
    gmtModified = json['gmtModified'];
    vehicleTypeId = json['vehicleTypeId'];
    submitBy = json['submitBy'];
    oilchangegasAmt = json['oilchangegasAmt'];
    useType = json['useType'];
    subletExcitationFee = json['subletExcitationFee'];
    isDeleted = json['isDeleted'];
    purchaseTax = json['purchaseTax'];
    hasGuarantor = json['hasGuarantor'];
    handVehicleBy = json['handVehicleBy'];
    subletOtherFee = json['subletOtherFee'];
    vehicleBrandId = json['vehicleBrandId'];
    approveTime = json['approveTime'];
    capitalSide = json['capitalSide'];
    downInsurancePaymentBy = json['downInsurancePaymentBy'];
    subletRemainderInsuranceFee = json['subletRemainderInsuranceFee'];
    channelId = json['channelId'];
    creator = json['creator'];
    side = json['side'];
    salePrice = json['salePrice'];
    productProperty = json['productProperty'];
    balanceAmount = json['balanceAmount'];
    subletPreparationFee = json['subletPreparationFee'];
    userId = json['userId'];
    loanAmount = json['loanAmount'];
    carLicenseAmt = json['carLicenseAmt'];
    paidDownInsurancePayment = json['paidDownInsurancePayment'];
    productCode = json['productCode'];
    packageCode = json['packageCode'];
    accidentInsuranceAmount = json['accidentInsuranceAmount'];
    approveBy = json['approveBy'];
    subletSalePrice = json['subletSalePrice'];
    gmtCreated = json['gmtCreated'];
    modifier = json['modifier'];
    saler = json['saler'];
    remaindRenewalDeposit = json['remaindRenewalDeposit'];
    illegalDeposit = json['illegalDeposit'];
    insuranceProperty = json['insuranceProperty'];
    perPayment = json['perPayment'];
    realAccidentInsuranceAmount = json['realAccidentInsuranceAmount'];
    accidentFee = json['accidentFee'];
    earlyDebtTransfer = json['earlyDebtTransfer'];
    gpsAmt = json['gpsAmt'];
    actualRate = json['actualRate'];
    otherAmt = json['otherAmt'];
    vehicleCode = json['vehicleCode'];
    remaindInsuranceAmt = json['remaindInsuranceAmt'];
    remaindOilchangegasAmt = json['remaindOilchangegasAmt'];
    insuranceAmt = json['insuranceAmt'];
    downInsurancePayment = json['downInsurancePayment'];
    totalAmt = json['totalAmt'];
    subletGpsPrice = json['subletGpsPrice'];
    deliverConfirmBy = json['deliverConfirmBy'];
    unpaidFinalPayment = json['unpaidFinalPayment'];
    salerPhone = json['salerPhone'];
    vehicleVendorId = json['vehicleVendorId'];
    subletCertHandleFee = json['subletCertHandleFee'];
    subletAssessPrice = json['subletAssessPrice'];
    deliverConfirmTime = json['deliverConfirmTime'];
    remark = json['remark'];
    remaindRedeemAmt = json['remaindRedeemAmt'];
    times = json['times'];
    contractApplyRemark = json['contractApplyRemark'];
    finalPayment = json['finalPayment'];
    redeemAmt = json['redeemAmt'];
    paidFinalPayment = json['paidFinalPayment'];
    applyBy = json['applyBy'];
    vehicleColor = json['vehicleColor'];
    capitalRate = json['capitalRate'];
    billCalcType = json['billCalcType'];
    nextYearInsuranceFee = json['nextYearInsuranceFee'];
    vehicleProperty = json['vehicleProperty'];
    remaindNextYearInsuranceFee = json['remaindNextYearInsuranceFee'];
    accelerateDepreciationFee = json['accelerateDepreciationFee'];
    renewalDeposit = json['renewalDeposit'];
    handVehicleTime = json['handVehicleTime'];
    paidFixPayment = json['paidFixPayment'];
    orderCode = json['orderCode'];
    licenseCityCode = json['licenseCityCode'];
    remaindAccelerateDepreciationFee = json['remaindAccelerateDepreciationFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderType'] = this.orderType;
    data['commonInsuranceAmt'] = this.commonInsuranceAmt;
    data['remaindIllegalDeposit'] = this.remaindIllegalDeposit;
    data['subletTotalPrice'] = this.subletTotalPrice;
    data['fixPayment'] = this.fixPayment;
    data['subletInsurancePrice'] = this.subletInsurancePrice;
    data['accidentInsuranceStatus'] = this.accidentInsuranceStatus;
    data['remaindDownPayment'] = this.remaindDownPayment;
    data['type'] = this.type;
    data['insuranceReturnType'] = this.insuranceReturnType;
    data['downPayment'] = this.downPayment;
    data['id'] = this.id;
    data['applyTime'] = this.applyTime;
    data['businessInsuranceAmount'] = this.businessInsuranceAmount;
    data['deliveryRemark'] = this.deliveryRemark;
    data['period'] = this.period;
    data['perpaymentType'] = this.perpaymentType;
    data['licenseProvinceCode'] = this.licenseProvinceCode;
    data['unpaidFixPayment'] = this.unpaidFixPayment;
    data['isDepositRefund'] = this.isDepositRefund;
    data['remaindCommonInsuranceAmt'] = this.remaindCommonInsuranceAmt;
    data['submitTime'] = this.submitTime;
    data['trafficInsuranceAmount'] = this.trafficInsuranceAmount;
    data['corganCode'] = this.corganCode;
    data['unpaidDownInsurancePayment'] = this.unpaidDownInsurancePayment;
    data['downInsurancePaymentTime'] = this.downInsurancePaymentTime;
    data['status'] = this.status;
    data['vehicleSeriesId'] = this.vehicleSeriesId;
    data['gmtModified'] = this.gmtModified;
    data['vehicleTypeId'] = this.vehicleTypeId;
    data['submitBy'] = this.submitBy;
    data['oilchangegasAmt'] = this.oilchangegasAmt;
    data['useType'] = this.useType;
    data['subletExcitationFee'] = this.subletExcitationFee;
    data['isDeleted'] = this.isDeleted;
    data['purchaseTax'] = this.purchaseTax;
    data['hasGuarantor'] = this.hasGuarantor;
    data['handVehicleBy'] = this.handVehicleBy;
    data['subletOtherFee'] = this.subletOtherFee;
    data['vehicleBrandId'] = this.vehicleBrandId;
    data['approveTime'] = this.approveTime;
    data['capitalSide'] = this.capitalSide;
    data['downInsurancePaymentBy'] = this.downInsurancePaymentBy;
    data['subletRemainderInsuranceFee'] = this.subletRemainderInsuranceFee;
    data['channelId'] = this.channelId;
    data['creator'] = this.creator;
    data['side'] = this.side;
    data['salePrice'] = this.salePrice;
    data['productProperty'] = this.productProperty;
    data['balanceAmount'] = this.balanceAmount;
    data['subletPreparationFee'] = this.subletPreparationFee;
    data['userId'] = this.userId;
    data['loanAmount'] = this.loanAmount;
    data['carLicenseAmt'] = this.carLicenseAmt;
    data['paidDownInsurancePayment'] = this.paidDownInsurancePayment;
    data['productCode'] = this.productCode;
    data['packageCode'] = this.packageCode;
    data['accidentInsuranceAmount'] = this.accidentInsuranceAmount;
    data['approveBy'] = this.approveBy;
    data['subletSalePrice'] = this.subletSalePrice;
    data['gmtCreated'] = this.gmtCreated;
    data['modifier'] = this.modifier;
    data['saler'] = this.saler;
    data['remaindRenewalDeposit'] = this.remaindRenewalDeposit;
    data['illegalDeposit'] = this.illegalDeposit;
    data['insuranceProperty'] = this.insuranceProperty;
    data['perPayment'] = this.perPayment;
    data['realAccidentInsuranceAmount'] = this.realAccidentInsuranceAmount;
    data['accidentFee'] = this.accidentFee;
    data['earlyDebtTransfer'] = this.earlyDebtTransfer;
    data['gpsAmt'] = this.gpsAmt;
    data['actualRate'] = this.actualRate;
    data['otherAmt'] = this.otherAmt;
    data['vehicleCode'] = this.vehicleCode;
    data['remaindInsuranceAmt'] = this.remaindInsuranceAmt;
    data['remaindOilchangegasAmt'] = this.remaindOilchangegasAmt;
    data['insuranceAmt'] = this.insuranceAmt;
    data['downInsurancePayment'] = this.downInsurancePayment;
    data['totalAmt'] = this.totalAmt;
    data['subletGpsPrice'] = this.subletGpsPrice;
    data['deliverConfirmBy'] = this.deliverConfirmBy;
    data['unpaidFinalPayment'] = this.unpaidFinalPayment;
    data['salerPhone'] = this.salerPhone;
    data['vehicleVendorId'] = this.vehicleVendorId;
    data['subletCertHandleFee'] = this.subletCertHandleFee;
    data['subletAssessPrice'] = this.subletAssessPrice;
    data['deliverConfirmTime'] = this.deliverConfirmTime;
    data['remark'] = this.remark;
    data['remaindRedeemAmt'] = this.remaindRedeemAmt;
    data['times'] = this.times;
    data['contractApplyRemark'] = this.contractApplyRemark;
    data['finalPayment'] = this.finalPayment;
    data['redeemAmt'] = this.redeemAmt;
    data['paidFinalPayment'] = this.paidFinalPayment;
    data['applyBy'] = this.applyBy;
    data['vehicleColor'] = this.vehicleColor;
    data['capitalRate'] = this.capitalRate;
    data['billCalcType'] = this.billCalcType;
    data['nextYearInsuranceFee'] = this.nextYearInsuranceFee;
    data['vehicleProperty'] = this.vehicleProperty;
    data['remaindNextYearInsuranceFee'] = this.remaindNextYearInsuranceFee;
    data['accelerateDepreciationFee'] = this.accelerateDepreciationFee;
    data['renewalDeposit'] = this.renewalDeposit;
    data['handVehicleTime'] = this.handVehicleTime;
    data['paidFixPayment'] = this.paidFixPayment;
    data['orderCode'] = this.orderCode;
    data['licenseCityCode'] = this.licenseCityCode;
    data['remaindAccelerateDepreciationFee'] =
        this.remaindAccelerateDepreciationFee;
    return data;
  }
}
