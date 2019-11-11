class VehicleType {
  String rearBrakeType;
  String userFuelConsumption;
  String enginePosition;
  String luggageVolume;
  String valveStructure;
  String modifier;
  String centerDifferentialLock;
  int vendorId;
  String fuelTankCapacity;
  int seriesId;
  String environmentalStandards;
  String seatNum;
  String len;
  String frontSuspensionType;
  String hoodType;
  String productionStatus;
  String luggageMode;
  String powerSteering;
  String displacement;
  String fuelMethod;
  int id;
  String engineDisplacementml;
  String height;
  String sizeType;
  String brandName;
  String seriesName;
  String airSuspension;
  int openApiId;
  String weight;
  String vendorName;
  String fuelGrade;
  String shiftPaddles;
  String colorList;
  String maxtOrque;
  String valvetrain;
  String yearType;
  String apiProductCode;
  String engineIntakeForm;
  String compressionRatio;
  String frontTrack;
  String driveMode;
  String parkingBrakeType;
  int brandId;
  String fullWeight;
  String name;
  String guidePrice;
  String vechileTax;
  String bodyStructure;
  String status;
  String maxtOrqueSpeed;
  String color;
  String departureAngle;
  String wheelBase;
  String rearSuspensionType;
  String comFuelConsumption;
  String doorNum;
  String isDeleted;
  String cylinderArrangeType;
  String warrantyPolicy;
  String gearbox;
  String cylinderBodyMaterial;
  String sportPackage;
  String creator;
  String cylinderHeadMaterial;
  String engineModel;
  String frontBrakeType;
  String minGroundClearance;
  String maxHorsePower;
  String officialAccelerationTime100;
  String salePrice;
  String toofType;
  String cylinderNum;
  String engineDisplacement;
  String inductionLuggage;
  String approaChangle;
  String fullName;
  String maxSpeed;
  String saleStatus;
  String rearTrack;
  String stroke;
  String bore;
  String testAccelerationTime100;
  String fuelType;
  String luggageOpenMode;
  String adjustableSuspension;
  String width;
  String maxPowerSpeed;
  String maxPower;
  String noticeModel;
  String roofLuggageRack;

  VehicleType({
    this.rearBrakeType,
    this.userFuelConsumption,
    this.enginePosition,
    this.luggageVolume,
    this.valveStructure,
    this.modifier,
    this.centerDifferentialLock,
    this.vendorId,
    this.fuelTankCapacity,
    this.seriesId,
    this.environmentalStandards,
    this.seatNum,
    this.len,
    this.frontSuspensionType,
    this.hoodType,
    this.productionStatus,
    this.luggageMode,
    this.powerSteering,
    this.displacement,
    this.fuelMethod,
    this.id,
    this.engineDisplacementml,
    this.height,
    this.sizeType,
    this.brandName,
    this.seriesName,
    this.airSuspension,
    this.openApiId,
    this.weight,
    this.vendorName,
    this.fuelGrade,
    this.shiftPaddles,
    this.colorList,
    this.maxtOrque,
    this.valvetrain,
    this.yearType,
    this.apiProductCode,
    this.engineIntakeForm,
    this.compressionRatio,
    this.frontTrack,
    this.driveMode,
    this.parkingBrakeType,
    this.brandId,
    this.fullWeight,
    this.name,
    this.guidePrice,
    this.vechileTax,
    this.bodyStructure,
    this.status,
    this.maxtOrqueSpeed,
    this.color,
    this.departureAngle,
    this.wheelBase,
    this.rearSuspensionType,
    this.comFuelConsumption,
    this.doorNum,
    this.isDeleted,
    this.cylinderArrangeType,
    this.warrantyPolicy,
    this.gearbox,
    this.cylinderBodyMaterial,
    this.sportPackage,
    this.creator,
    this.cylinderHeadMaterial,
    this.engineModel,
    this.frontBrakeType,
    this.minGroundClearance,
    this.maxHorsePower,
    this.officialAccelerationTime100,
    this.salePrice,
    this.toofType,
    this.cylinderNum,
    this.engineDisplacement,
    this.inductionLuggage,
    this.approaChangle,
    this.fullName,
    this.maxSpeed,
    this.saleStatus,
    this.rearTrack,
    this.stroke,
    this.bore,
    this.testAccelerationTime100,
    this.fuelType,
    this.luggageOpenMode,
    this.adjustableSuspension,
    this.width,
    this.maxPowerSpeed,
    this.maxPower,
    this.noticeModel,
    this.roofLuggageRack,
  });

  VehicleType.fromJson(Map<String, dynamic> json) {
    rearBrakeType = json['rearBrakeType'];
    userFuelConsumption = json['userFuelConsumption'];
    enginePosition = json['enginePosition'];
    luggageVolume = json['luggageVolume'];
    valveStructure = json['valveStructure'];
    modifier = json['modifier'];
    centerDifferentialLock = json['centerDifferentialLock'];
    vendorId = json['vendorId'];
    fuelTankCapacity = json['fuelTankCapacity'];
    seriesId = json['seriesId'];
    environmentalStandards = json['environmentalStandards'];
    seatNum = json['seatNum'];
    len = json['len'];
    frontSuspensionType = json['frontSuspensionType'];
    hoodType = json['hoodType'];
    productionStatus = json['productionStatus'];
    luggageMode = json['luggageMode'];
    powerSteering = json['powerSteering'];
    displacement = json['displacement'];
    fuelMethod = json['fuelMethod'];
    id = json['id'];
    engineDisplacementml = json['engineDisplacementml'];
    height = json['height'];
    sizeType = json['sizeType'];
    brandName = json['brandName'];
    seriesName = json['seriesName'];
    airSuspension = json['airSuspension'];
    openApiId = json['openApiId'];
    weight = json['weight'];
    vendorName = json['vendorName'];
    fuelGrade = json['fuelGrade'];
    shiftPaddles = json['shiftPaddles'];
    colorList = json['colorList'];
    maxtOrque = json['maxtOrque'];
    valvetrain = json['valvetrain'];
    yearType = json['yearType'];
    apiProductCode = json['apiProductCode'];
    engineIntakeForm = json['engineIntakeForm'];
    compressionRatio = json['compressionRatio'];
    frontTrack = json['frontTrack'];
    driveMode = json['driveMode'];
    parkingBrakeType = json['parkingBrakeType'];
    brandId = json['brandId'];
    fullWeight = json['fullWeight'];
    name = json['name'];
    guidePrice = json['guidePrice'];
    vechileTax = json['vechileTax'];
    bodyStructure = json['bodyStructure'];
    status = json['status'];
    maxtOrqueSpeed = json['maxtOrqueSpeed'];
    color = json['color'];
    departureAngle = json['departureAngle'];
    wheelBase = json['wheelBase'];
    rearSuspensionType = json['rearSuspensionType'];
    comFuelConsumption = json['comFuelConsumption'];
    doorNum = json['doorNum'];
    isDeleted = json['isDeleted'];
    cylinderArrangeType = json['cylinderArrangeType'];
    warrantyPolicy = json['warrantyPolicy'];
    gearbox = json['gearbox'];
    cylinderBodyMaterial = json['cylinderBodyMaterial'];
    sportPackage = json['sportPackage'];
    creator = json['creator'];
    cylinderHeadMaterial = json['cylinderHeadMaterial'];
    engineModel = json['engineModel'];
    frontBrakeType = json['frontBrakeType'];
    minGroundClearance = json['minGroundClearance'];
    maxHorsePower = json['maxHorsePower'];
    officialAccelerationTime100 = json['officialAccelerationTime100'];
    salePrice = json['salePrice'];
    toofType = json['toofType'];
    cylinderNum = json['cylinderNum'];
    engineDisplacement = json['engineDisplacement'];
    inductionLuggage = json['inductionLuggage'];
    approaChangle = json['approaChangle'];
    fullName = json['fullName'];
    maxSpeed = json['maxSpeed'];
    saleStatus = json['saleStatus'];
    rearTrack = json['rearTrack'];
    stroke = json['stroke'];
    bore = json['bore'];
    testAccelerationTime100 = json['testAccelerationTime100'];
    fuelType = json['fuelType'];
    luggageOpenMode = json['luggageOpenMode'];
    adjustableSuspension = json['adjustableSuspension'];
    width = json['width'];
    maxPowerSpeed = json['maxPowerSpeed'];
    maxPower = json['maxPower'];
    noticeModel = json['noticeModel'];
    roofLuggageRack = json['roofLuggageRack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rearBrakeType'] = this.rearBrakeType;
    data['userFuelConsumption'] = this.userFuelConsumption;
    data['enginePosition'] = this.enginePosition;
    data['luggageVolume'] = this.luggageVolume;
    data['valveStructure'] = this.valveStructure;
    data['modifier'] = this.modifier;
    data['centerDifferentialLock'] = this.centerDifferentialLock;
    data['vendorId'] = this.vendorId;
    data['fuelTankCapacity'] = this.fuelTankCapacity;
    data['seriesId'] = this.seriesId;
    data['environmentalStandards'] = this.environmentalStandards;
    data['seatNum'] = this.seatNum;
    data['len'] = this.len;
    data['frontSuspensionType'] = this.frontSuspensionType;
    data['hoodType'] = this.hoodType;
    data['productionStatus'] = this.productionStatus;
    data['luggageMode'] = this.luggageMode;
    data['powerSteering'] = this.powerSteering;
    data['displacement'] = this.displacement;
    data['fuelMethod'] = this.fuelMethod;
    data['id'] = this.id;
    data['engineDisplacementml'] = this.engineDisplacementml;
    data['height'] = this.height;
    data['sizeType'] = this.sizeType;
    data['brandName'] = this.brandName;
    data['seriesName'] = this.seriesName;
    data['airSuspension'] = this.airSuspension;
    data['openApiId'] = this.openApiId;
    data['weight'] = this.weight;
    data['vendorName'] = this.vendorName;
    data['fuelGrade'] = this.fuelGrade;
    data['shiftPaddles'] = this.shiftPaddles;
    data['colorList'] = this.colorList;
    data['maxtOrque'] = this.maxtOrque;
    data['valvetrain'] = this.valvetrain;
    data['yearType'] = this.yearType;
    data['apiProductCode'] = this.apiProductCode;
    data['engineIntakeForm'] = this.engineIntakeForm;
    data['compressionRatio'] = this.compressionRatio;
    data['frontTrack'] = this.frontTrack;
    data['driveMode'] = this.driveMode;
    data['parkingBrakeType'] = this.parkingBrakeType;
    data['brandId'] = this.brandId;
    data['fullWeight'] = this.fullWeight;
    data['name'] = this.name;
    data['guidePrice'] = this.guidePrice;
    data['vechileTax'] = this.vechileTax;
    data['bodyStructure'] = this.bodyStructure;
    data['status'] = this.status;
    data['maxtOrqueSpeed'] = this.maxtOrqueSpeed;
    data['color'] = this.color;
    data['departureAngle'] = this.departureAngle;
    data['wheelBase'] = this.wheelBase;
    data['rearSuspensionType'] = this.rearSuspensionType;
    data['comFuelConsumption'] = this.comFuelConsumption;
    data['doorNum'] = this.doorNum;
    data['isDeleted'] = this.isDeleted;
    data['cylinderArrangeType'] = this.cylinderArrangeType;
    data['warrantyPolicy'] = this.warrantyPolicy;
    data['gearbox'] = this.gearbox;
    data['cylinderBodyMaterial'] = this.cylinderBodyMaterial;
    data['sportPackage'] = this.sportPackage;
    data['creator'] = this.creator;
    data['cylinderHeadMaterial'] = this.cylinderHeadMaterial;
    data['engineModel'] = this.engineModel;
    data['frontBrakeType'] = this.frontBrakeType;
    data['minGroundClearance'] = this.minGroundClearance;
    data['maxHorsePower'] = this.maxHorsePower;
    data['officialAccelerationTime100'] = this.officialAccelerationTime100;
    data['salePrice'] = this.salePrice;
    data['toofType'] = this.toofType;
    data['cylinderNum'] = this.cylinderNum;
    data['engineDisplacement'] = this.engineDisplacement;
    data['inductionLuggage'] = this.inductionLuggage;
    data['approaChangle'] = this.approaChangle;
    data['fullName'] = this.fullName;
    data['maxSpeed'] = this.maxSpeed;
    data['saleStatus'] = this.saleStatus;
    data['rearTrack'] = this.rearTrack;
    data['stroke'] = this.stroke;
    data['bore'] = this.bore;
    data['testAccelerationTime100'] = this.testAccelerationTime100;
    data['fuelType'] = this.fuelType;
    data['luggageOpenMode'] = this.luggageOpenMode;
    data['adjustableSuspension'] = this.adjustableSuspension;
    data['width'] = this.width;
    data['maxPowerSpeed'] = this.maxPowerSpeed;
    data['maxPower'] = this.maxPower;
    data['noticeModel'] = this.noticeModel;
    data['roofLuggageRack'] = this.roofLuggageRack;
    return data;
  }
}
