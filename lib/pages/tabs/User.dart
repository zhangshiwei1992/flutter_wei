import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  static final String routerName = "/user";

  UserPage({Key key}) : super(key: key);

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Text("用户中心");
  }
}
