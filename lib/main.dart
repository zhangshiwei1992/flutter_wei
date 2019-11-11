import 'package:flutter/material.dart';

import 'config/EnvInfo_my.dart';
import 'pages/tabs/Tabs.dart';
import 'routers/AppRoutes.dart';

void main() {
  //设定运行环境的环境变量
  EnvInfo_My.env = Env.DEV;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Tabs(),
      routes: AppRoutes.genAllRoutes(context),
    );
  }
}
