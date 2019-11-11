import 'package:flutter/material.dart';
import 'package:flutter_wei/constants/app_style.dart';
import 'package:flutter_wei/utils/permission_util.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/ScreenAdaper.dart';
import 'Cart.dart';
import 'Category.dart';
import 'Home.dart';
import 'User.dart';

class Tabs extends StatefulWidget {
  static final String routerName = "/tabs";

  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    this._pageController = new PageController(initialPage: this._currentIndex);
    checkSystemAuth();
  }

  /// 检查系统权限：照相机、相册、通讯
  checkSystemAuth() async {
    /// 在刚进入app首页的时候，只需要先确保访问：location,contacts 其他的权限：camera,storage,contacts, phone,photos,在需要使用的时候再进行授权
    PermissionUtil.requestPermissions([
      PermissionGroup.location,
      PermissionGroup.contacts,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return Scaffold(
      appBar: _currentIndex != 3
          ? AppBar(
              leading: IconButton(
                icon: Icon(Icons.center_focus_weak,
                    size: 28, color: Colors.black87),
                onPressed: null,
              ),
              title: InkWell(
                child: Container(
                  height: ScreenAdapter.height(68),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.search),
                      Text("笔记本",
                          style: TextStyle(fontSize: ScreenAdapter.size(28)))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.message, size: 28, color: Colors.black87),
                  onPressed: null,
                )
              ],
            )
          : AppBar(
              title: Text("用户中心"),
            ),
      body: PageView(
        controller: this._pageController,
        children: [
          HomePage(),
          CategoryPage(),
          CartPage(),
          UserPage(),
        ],
        onPageChanged: (index) {
          _tabController.animateTo(index);
          _currentIndex = index;
          print("_currentIndex=======" + _currentIndex.toString());
        },
      ),
      bottomNavigationBar: Material(
        color: Color(AppStyle.color_white),
        child: TabBar(
          controller: _tabController,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home, color: Color(AppStyle.color_yellow_f8)),
              child: Text(
                '首页',
                style: TextStyle(color: Color(AppStyle.color_yellow_f8)),
              ),
            ),
            Tab(
              icon: Icon(Icons.shop, color: Color(AppStyle.color_yellow_f8)),
              child: Text(
                '分类',
                style: TextStyle(color: Color(AppStyle.color_yellow_f8)),
              ),
            ),
            Tab(
              icon: Icon(Icons.explore, color: Color(AppStyle.color_yellow_f8)),
              child: Text(
                '购物车',
                style: TextStyle(color: Color(AppStyle.color_yellow_f8)),
              ),
            ),
            Tab(
              icon: Icon(Icons.account_circle,
                  color: Color(AppStyle.color_yellow_f8)),
              child: Text('我的',
                  style: TextStyle(color: Color(AppStyle.color_yellow_f8))),
            ),
          ],
          onTap: (index) {
            _pageController.jumpTo(MediaQuery.of(context).size.width * index);
          },
        ),
      ),
    );
  }
}
