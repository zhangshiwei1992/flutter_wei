import 'package:flutter/material.dart';

/// 环境信息 - 方便在发送请求的时候直接获取host
class EnvInfo {
  static String host;
  static String accessKeyId;
  static String accessKeySecret;
  static String bucket;
  static String fileDir;
  static String ossHost;
  static String ossFileDir;
}

/// App的配置信息
class AppConfig extends InheritedWidget {
  /// 后端API接口调用的host
  final String host;

  /// App的版本号
  final String version;

  AppConfig({
    @required this.host,
    @required this.version,
    @required Widget child,
  }) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  /// App创建之后再也不会变化了，所以设置为false
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
