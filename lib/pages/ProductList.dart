import 'package:flutter/material.dart';
import 'package:flutter_wei/model/Result.dart';

import '../config/LoadingWidget.dart';
import '../model/FileDetail.dart';
import '../service/SearchServices.dart';
import '../utils/HttpUtils.dart';
import '../utils/ScreenAdaper.dart';

class ProductListPage extends StatefulWidget {
  static final String routerName = "/productList";
  Map arguments;

  ProductListPage({Key key, this.arguments}) : super(key: key);

  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  //二级导航选中判断
  int _selectHeaderId = 1;

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

  // 是否有搜索的数据
  bool _hasData = true;

  List<FileDetail> _fileDetailList = [];
  String _defaultImage =
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719486988&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=VqVKTd%2B8Ojh6EuQhRaKdXR0v5Nw%3D";

  // 配置search搜索框的值
  var _initKeywordsController = new TextEditingController();

  // 分类页面传入的二级目录值: 订单编号
  var _orderCode;

  // 头部搜索栏出入的值
  var _keywords;

  @override
  void initState() {
    super.initState();
    _getFileDetailPage();

    this._orderCode = widget.arguments["orderCode"];

    this._keywords = widget.arguments["keywords"];
    // 给search框框赋值
    this._initKeywordsController.text = this._keywords;

    // 监听滚动条滚动事件
    _scrollController.addListener(() {
      // 获取滚动条滚动的高度  对比  获取页面高度
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        if (this.canPostFlag && this._hasMore) {
          _getFileDetailPage();
        }
      }
    });
  }

  _getFileDetailPage() async {
    setState(() {
      this.canPostFlag = false;
    });

    var _requestBody = {};
    if (_orderCode != null && _orderCode != '') {
      _requestBody = {
        "extraInfo": {},
        "pageNum": _pageNum,
        "pageSize": _pageSize,
        "param": {
          'businessCode': _orderCode,
        },
      };
    } else {
      _requestBody = {
        "extraInfo": {
          'fileNameLike': _keywords,
        },
        "pageNum": _pageNum,
        "pageSize": _pageSize,
        "param": {},
      };
    }

    Result result = await dioPost("/fileDetail/findPage", _requestBody);

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

    // 判断是否有搜索数据
    if (_fileDetailList.length == 0 && this._pageNum == 1) {
      setState(() {
        this._hasData = false;
      });
    } else {
      this._hasData = true;
    }
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

  /*
  排序:价格升序 sort=price_1 价格降序 sort=price_-1  销量升序 sort=salecount_1 销量降序 sort=salecount_-1
  */
  String _sort = "";

  /*二级导航数据*/
  List _subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort": -1,
      // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];

  // 导航改变的时候触发
  _subHeaderChange(id) {
    if (id == 4) {
      _scaffoldKey.currentState.openEndDrawer();
      setState(() {
        this._selectHeaderId = id;
      });
    } else {
      setState(() {
        this._selectHeaderId = id;
        this._sort =
            "${this._subHeaderList[id - 1]["fileds"]}_${this._subHeaderList[id - 1]["sort"]}";

        // 重置分页
        this._pageNum = 1;
        // 重置数据
        this._fileDetailList = [];
        // 改变sort排序
        this._subHeaderList[id - 1]['sort'] =
            this._subHeaderList[id - 1]['sort'] * -1;
        // 回到顶部
        _scrollController.jumpTo(0);
        // 重置_hasMore
        this._hasMore = true;
        // 重新请求
        this._getFileDetailPage();
      });
    }
  }

  //显示header Icon
  Widget _showIcon(id) {
    if (id == 2 || id == 3) {
      if (this._subHeaderList[id - 1]["sort"] == 1) {
        return Icon(Icons.arrow_drop_down);
      }
      return Icon(Icons.arrow_drop_up);
    }
    return Text("");
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
            bottom:
                BorderSide(width: 1, color: Color.fromRGBO(233, 233, 233, 0.9)),
          ),
        ),
        child: Row(
          children: this._subHeaderList.map((value) {
            return Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${value["title"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: (this._selectHeaderId == value["id"])
                                ? Colors.red
                                : Colors.black54),
                      ),
                      _showIcon(value["id"])
                    ],
                  ),
                ),
                onTap: () {
                  _subHeaderChange(value["id"]);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          child: TextField(
            controller: this._initKeywordsController,
            autofocus: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              setState(() {
                this._keywords = value;
              });
            },
          ),
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 0.8),
              borderRadius: BorderRadius.circular(30)),
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
            onTap: () {
              SearchServices.setHistoryData(this._keywords);
              this._subHeaderChange(1);
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text("实现筛选功能"),
        ),
      ),
      body: _hasData
          ? Stack(
              children: <Widget>[
                _productListWidget(),
                _subHeaderWidget(),
              ],
            )
          : Center(
              child: Text("没有您要浏览的数据"),
            ),
    );
  }
}
