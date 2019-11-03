import 'package:flutter/material.dart';
import 'package:flutter_wei/utils/ScreenAdaper.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                // 输入框圆角
                borderRadius: BorderRadius.circular(30),
                // 去除四周边框
                borderSide: BorderSide.none,
              ),
            ),
          ),
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.8),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              height: ScreenAdapter.height(68),
              width: ScreenAdapter.width(80),
              child: Row(
                children: <Widget>[
                  Text("搜索"),
                ],
              ),
            ),
            onTap: () {},
          )
        ],
      ),
      body: Text('搜索'),
    );
  }
}
