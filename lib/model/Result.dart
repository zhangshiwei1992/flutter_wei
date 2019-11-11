/// 调用API返回结果统一样式，便于前端处理

class Result<T> {
  bool success;
  String errorCode;
  String errorMsg;
  T param;
  T value;
  Map extraInfo;
  int pageSize;
  int pageNum;
  int totalCount;
  List<Sort> sort;

  Result({
    this.success,
    this.errorCode,
    this.errorMsg,
    this.param,
    this.value,
    this.extraInfo,
    this.pageSize,
    this.pageNum,
    this.totalCount,
    this.sort,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    var list = json['sort'] as List;
    List<Sort> sortList = [];
    if (null != list && list.isNotEmpty) {
      sortList = list.map((record) => Sort.fromJson(record)).toList();
    }

    return Result(
      success: json['success'],
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
      param: json['param'],
      value: json['value'],
      extraInfo: json['extraInfo'],
      pageSize: json['pageSize'],
      pageNum: json['pageNum'],
      totalCount: json['totalCount'],
      sort: sortList,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'errorCode': errorCode,
        'errorMsg': errorMsg,
        'value': value,
        'extraInfo': extraInfo,
        'pageSize': pageSize,
        'pageNum': pageNum,
        'param': param,
        'totalCount': totalCount,
        'sort': Sort.genSortListJson(sort),
      };

  static setErrorMsg(Result result, String errorMsg) {
    result.success = false;
    result.errorMsg = errorMsg;
    return result;
  }

  static setErrorInfo(Result result, String errorCode, String errorMsg) {
    result.success = false;
    result.errorCode = errorCode;
    result.errorMsg = errorMsg;
    return result;
  }

  static genErrorMsg(String errorMsg) {
    Result result = new Result();
    result.success = false;
    result.errorMsg = errorMsg;
    result.value = null;
    return result;
  }

  isSuccess() {
    return success;
  }
}

class Sort {
  String direction;
  String property;

  Sort({
    this.direction,
    this.property,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      direction: json['direction'],
      property: json['property'],
    );
  }

  Map<String, dynamic> toJson() => {
        'direction': direction,
        'property': property,
      };

  static dynamic genSortListJson(List<Sort> list) {
    List result = [];
    if (null != list && list.isNotEmpty && list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        result.add(list[i].toJson());
      }
    }
    return result;
  }
}
