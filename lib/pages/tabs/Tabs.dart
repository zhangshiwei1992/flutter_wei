import 'package:flutter/material.dart';
import 'package:flutter_wei/pages/cart/Cart.dart';
import 'package:flutter_wei/pages/category/Category.dart';
import 'package:flutter_wei/pages/home/Home.dart';
import 'package:flutter_wei/pages/user/User.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  List _pageList = [HomePage(), CategoryPage(), CartPage(), UserPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wei_shop"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("分类"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("购物车"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("我的"),
          ),
        ],
      ),
    );
  }
}
