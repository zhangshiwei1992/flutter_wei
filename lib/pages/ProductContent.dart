import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wei/model/FileDetail.dart';
import 'package:flutter_wei/model/Result.dart';
import 'package:flutter_wei/utils/HttpUtils.dart';

import '../utils/ScreenAdaper.dart';
import '../widget/JdButton.dart';
import 'ProductContent/ProductContentFirst.dart';
import 'ProductContent/ProductContentSecond.dart';
import 'ProductContent/ProductContentThird.dart';

class ProductContentPage extends StatefulWidget {
  static final String routerName = "/productContent";
  Map arguments;

  ProductContentPage({Key key, this.arguments}) : super(key: key);

  _ProductContentPageState createState() => _ProductContentPageState();
}

class _ProductContentPageState extends State<ProductContentPage> {
  FileDetail _fileDetail = new FileDetail();

  @override
  void initState() {
    super.initState();
    _findFileDetailById();
    print('id: ' + widget.arguments['id'].toString());
    print('_keywords: ' + widget.arguments['_keywords'].toString());
    print('vehicleBrandId: ' + widget.arguments['vehicleBrandId'].toString());
  }

  // 附件详情
  _findFileDetailById() async {
    var fileDetailId = widget.arguments['id'];
    if (fileDetailId == null || fileDetailId == '') {
      fileDetailId = 781361;
    }
    Result result = await dioPost(
        "/fileDetail/findByPrimaryKey", {"id": "${fileDetailId}"});
    setState(() {
      if (result.success && result.value != null) {
        _fileDetail = FileDetail.fromJson(result.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenAdapter.width(400),
                child: TabBar(
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      child: Text('商品'),
                    ),
                    Tab(
                      child: Text('详情'),
                    ),
                    Tab(
                      child: Text('评价'),
                    )
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                // 下拉菜单
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                      ScreenAdapter.width(600), 76, 10, 0),
                  items: [
                    PopupMenuItem(
                      child: Row(
                        children: <Widget>[Icon(Icons.home), Text("首页")],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: <Widget>[Icon(Icons.search), Text("搜索")],
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            TabBarView(
              children: <Widget>[
                ProductContentFirst(
                    fileDetail: _fileDetail,
                    vehicleBrandId: widget.arguments['vehicleBrandId']),
                ProductContentSecond(),
                ProductContentThird()
              ],
            ),
            Positioned(
              width: ScreenAdapter.width(750),
              height: ScreenAdapter.width(88),
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black26, width: 1),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(3)),
                      width: 100,
                      height: ScreenAdapter.height(88),
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.shopping_cart),
                          Text("购物车")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: JdButton(
                        color: Color.fromRGBO(253, 1, 0, 0.9),
                        text: "加入购物车",
                        cb: () {
                          print('加入购物车');
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: JdButton(
                        color: Color.fromRGBO(255, 165, 0, 0.9),
                        text: "立即购买",
                        cb: () {
                          print('立即购买');
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
