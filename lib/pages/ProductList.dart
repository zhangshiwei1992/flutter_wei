import 'package:flutter/material.dart';
import 'package:flutter_wei/config/LoadingWidget.dart';
import 'package:flutter_wei/config/ScreenAdaper.dart';
import 'package:flutter_wei/constants/Result.dart';
import 'package:flutter_wei/model/FileDetail.dart';
import 'package:flutter_wei/utils/HttpUtils.dart';

class ProductListPage extends StatefulWidget {
  Map arguments;

  ProductListPage({Key key, this.arguments}) : super(key: key);

  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // 侧滑控制器
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // 用于上拉分页 listView 的控制器
  ScrollController _scrollController = ScrollController();

  int _pageNum = 1;
  int _pageSize = 8;

  // 是否有更多数据
  bool _hasMore = true;

  // 能否发起请求获取更多数据的标识
  bool canPostFlag = true;

  List<FileDetail> _fileDetailList = [];
  String _defaultImage =
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719486988&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=VqVKTd%2B8Ojh6EuQhRaKdXR0v5Nw%3D";

  @override
  void initState() {
    super.initState();
    _getFileDetailPage();

    // 监听滚动条滚动事件
    _scrollController.addListener(() {
      // 获取滚动条滚动的高度  对比  获取页面高度
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        if (this.canPostFlag && this._hasMore) {
          _getFileDetailPage();
          print('=======向上滑动=======加载更多=======');
        }
      }
    });
  }

  _getFileDetailPage() async {
    setState(() {
      this.canPostFlag = false;
    });
    Result result = await dioPost(
      "/fileDetail/findPage",
      {
        "extraInfo": {},
        "pageNum": _pageNum,
        "pageSize": _pageSize,
        "param": {
          'businessCode': widget.arguments['orderCode'],
        },
      },
    );

    setState(() {
      List _list = result.value;
      print('此次请求获取到的条数: ' + _list.length.toString());
      _list.forEach((fileDetail) {
        _fileDetailList.add(FileDetail.fromJson(fileDetail));
      });
      this.canPostFlag = true;
      if (_list.length < this._pageSize) {
        this._hasMore = false;
      } else {
        this._hasMore = true;
        this._pageNum++;
      }
    });
  }

  Future<void> _freshList() async {
    print('下拉刷新======================开始');
    await Future.delayed(Duration(milliseconds: 2000), () {
      this._pageNum = 1;
      _getFileDetailPage();
      print('下拉刷新======================完成');
    });
  }

  String _filePath(index) {
    String _filePath = _fileDetailList[index].filePath;
    String _path = _filePath != '' &&
            _filePath != null &&
            (_filePath.contains(".png") ||
                _filePath.contains('.jpg') ||
                _filePath.contains('.jpeg'))
        ? _filePath
        : _defaultImage;
    return _path;
  }

  // 产品列表信息
  Widget _productListWidget() {
    if (this._fileDetailList.length > 0) {
      return RefreshIndicator(
        onRefresh: _freshList,
        child: Container(
          margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _fileDetailList.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _productLeft(index),
                      _productRight(index),
                    ],
                  ),
                  Divider(height: 20),
                  _showMore(index),
                ],
              );
            },
          ),
        ),
      );
    } else {
      return LoadingWidget();
    }
  }

// 显示加载中的圈圈 或 底线
  Widget _showMore(index) {
    print('this._hasMore==' +
        this._hasMore.toString() +
        '; index==' +
        index.toString() +
        '; length减去一结果为' +
        (this._fileDetailList.length - 1).toString() +
        '; canPostFlag ==' +
        canPostFlag.toString());

    if (this._hasMore) {
      return (index == this._fileDetailList.length - 1)
          ? LoadingWidget()
          : Text("", style: TextStyle(color: Colors.red, fontSize: 1));
    } else {
      return (index == this._fileDetailList.length - 1)
          ? Text("--我是有底线的--")
          : Text("", style: TextStyle(color: Colors.red, fontSize: 1));
    }
  }

  // 筛选导航
  Widget _subHeaderWidget() {
    return Positioned(
      top: 0,
      height: ScreenAdapter.height(80),
      width: ScreenAdapter.width(750),
      child: Container(
        width: ScreenAdapter.width(750),
        height: ScreenAdapter.height(80),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(233, 233, 233, 0.9)))),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text(
                    "综合",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text("名称", textAlign: TextAlign.center),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text("编号", textAlign: TextAlign.center),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text("筛选", textAlign: TextAlign.center),
                ),
                onTap: () {
                  _scaffoldKey.currentState.openEndDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 产品列表左侧的图片
  Widget _productLeft(index) {
    return Container(
      width: ScreenAdapter.width(180),
      height: ScreenAdapter.height(180),
      child: Image.network(
        _filePath(index),
        fit: BoxFit.cover,
      ),
    );
  }

  // 产品列表右侧的文字
  Widget _productRight(index) {
    return Expanded(
      flex: 1,
      child: Container(
        height: ScreenAdapter.height(180),
        margin: EdgeInsets.only(left: 10),
        child: Column(
          // 主轴对准,间距一致
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _fileDetailList[index].fileName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(36),
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                  //注意 如果Container里面加上decoration属性，这个时候color属性必须得放在BoxDecoration
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(230, 230, 230, 0.9),
                  ),
                  child: Text(
                    _fileDetailList[index].id.toString(),
                  ),
                ),
                Container(
                  height: ScreenAdapter.height(36),
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(230, 230, 230, 0.9),
                  ),
                  child: Text(
                    _fileDetailList[index].fileId.toString(),
                  ),
                ),
              ],
            ),
            Text(
              _fileDetailList[index].fileCode,
              style: TextStyle(color: Colors.red, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("商品列表"),
// 隐藏左侧返回箭头
//        leading: Text(""),
        // 隐藏右侧侧拉框按钮
        actions: <Widget>[Text("")],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text("实现筛选功能"),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _productListWidget(),
          _subHeaderWidget(),
        ],
      ),
    );
  }
}
