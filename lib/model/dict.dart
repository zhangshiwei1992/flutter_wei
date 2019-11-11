/// 字典表
class DictCode {
  String dictGroup;
  String code;
  String name;
  String description;
  int sort;

  DictCode({this.dictGroup,this.code,this.name,this.description,this.sort,});

  factory DictCode.fromJson(Map<String, dynamic> json) {
    return DictCode(
      dictGroup: json['dictGroup'] ,
      code: json['code'] ,
      name:json['name'],
      description:json['description'],
      sort:json['sort'],
    );
  }

  Map<String, dynamic> toJson() =>{
    'dictGroup': dictGroup,
    'code':code,
    'name':name,
    'description':description,
    'sort': sort,
  };

  /// 根据字典代码从字典列表中获取字典名称
  static String genNameByCode(List<DictCode> dictList, String code){
    String result = '';
    if(null != dictList && dictList.isNotEmpty && dictList.length > 0){
      for(int i = 0 ; i < dictList.length; i++){
        if(dictList[i].code == code){
          result = dictList[i].name;
          break;
        }
      }
    }
    return result;
  }

  /// 根据字典代码从字典列表中获取字典描述
  static String genDescriptionByCode(List<DictCode> dictList, String code){
    String result = '';
    if(null != dictList && dictList.isNotEmpty && dictList.length > 0){
      for(int i = 0 ; i < dictList.length; i++){
        if(dictList[i].code == code){
          result = dictList[i].description;
          break;
        }
      }
    }
    return result;
  }

  @override
  bool operator ==(other) {
    // 判断是否是非
    if(other is! DictCode){
      return false;
    }
    final DictCode dict = other;
    return name == dict.name
        && code == dict.code;
  }


}