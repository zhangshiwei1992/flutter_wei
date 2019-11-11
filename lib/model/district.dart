class District {
  String code;
  String name;
  String initial;
  int level;
  List<District> list;

  District({
    this.code,
    this.name,
    this.initial,
    this.level,
    this.list,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    // list类型数据的处理
    var list = json['list'] as List;
    List<District> districtList = [];
    if (null != list && list.isNotEmpty) {
      districtList = list.map((record) => District.fromJson(record)).toList();
    }

    return District(
      code: json['code'],
      name: json['name'],
      initial: json['initial'],
      level: json['level'],
      list: districtList,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'initial': initial,
        'level': level,
        'list': District.genListJson(list),
      };

  static dynamic genListJson(List<District> list) {
    List result = [];
    if (null != list && list.isNotEmpty && list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        result.add(list[i].toJson());
      }
    }
    return result;
  }
}
