import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wei/constants/app_constant.dart';
import 'package:flutter_wei/model/Result.dart';

import '../../config/LoadingWidget.dart';
import '../../model/FileDetail.dart';
import '../../model/VehicleBrand.dart';
import '../../utils/HttpUtils.dart';
import '../../utils/ScreenAdaper.dart';
import '../ProductContent.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<VehicleBrand> _bBrandList = [];
  List<VehicleBrand> _jBrandList = [];
  List<FileDetail> _fileDetailList = [];
  String _defaultName = "卡丁车";

  @override
  void initState() {
    super.initState();
    _getBBrandList();
    _getJBrandList();
    _getFileDetailList();
  }

  _getBBrandList() async {
    Result result = await dioPost("/vehicleBrand/findList", {"initial": "C"});
    setState(() {
      _bBrandList = [];
      if (result.success) {
        if (result.value != null) {
          result.value.forEach((brand) {
            _bBrandList.add(VehicleBrand.fromJson(brand));
          });
        }
      }
    });
  }

  _getJBrandList() async {
    Result result = await dioPost("/vehicleBrand/findList", {"initial": "J"});
    setState(() {
      _jBrandList = [];
      if (result.success) {
        if (result.value != null) {
          result.value.forEach((brand) {
            _jBrandList.add(VehicleBrand.fromJson(brand));
          });
        }
      }
    });
  }

  _getFileDetailList() async {
    Result result = await dioPost(
        //  VX15595590860000000009    OR201906142011
        "/fileDetail/findList",
        {'businessCode': 'VX15595590860000000009'});
    setState(() {
      _fileDetailList = [];
      if (result.success) {
        if (result.value != null) {
          result.value.forEach((fileDetail) {
            _fileDetailList.add(FileDetail.fromJson(fileDetail));
          });
        }
      }
    });
  }

  // 轮播图
  Widget _swiperWidget() {
    return _bBrandList.length > 0
        ? InkWell(
            onTap: () {
              Map argumentsMap = {
                "id": "",
                "_keywords": "",
                "vehicleBrandId": "${_bBrandList[0].id}",
              };
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductContentPage(arguments: argumentsMap),
                ),
              );
            },
            child: Container(
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      _filePath(_bBrandList[index].logo),
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: _bBrandList.length,
                  pagination: new SwiperPagination(),
                  autoplay: true,
                ),
              ),
            ),
          )
        : LoadingWidget();
  }

  // 标题行
  Widget _titleWidget(textString) {
    return Container(
      height: ScreenAdapter.height(32),
      margin: EdgeInsets.only(
        left: ScreenAdapter.height(20),
      ),
      padding: EdgeInsets.only(
        left: ScreenAdapter.height(20),
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.red,
            width: ScreenAdapter.height(10),
          ),
        ),
      ),
      child: Text(
        textString,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  // 热门商品
  Widget _hotProductListWidget() {
    return _jBrandList.length > 0
        ? Container(
            height: ScreenAdapter.height(234),
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: ListView.builder(
              // 水平滑动的listView
              scrollDirection: Axis.horizontal,
              itemCount: _jBrandList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: ScreenAdapter.height(140),
                      width: ScreenAdapter.width(140),
                      margin: EdgeInsets.only(right: ScreenAdapter.width(21)),
                      child: Image.network(
                        _filePath(_jBrandList[index].logo),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: ScreenAdapter.height(10),
                      ),
                      height: ScreenAdapter.height(44),
                      child: Text(
                        _jBrandList[index].name != '' &&
                                _jBrandList[index].name != null
                            ? _jBrandList[index].name
                            : _defaultName,
                      ),
                    )
                  ],
                );
              },
            ),
          )
        : LoadingWidget();
  }

  String _filePath(_filePath) {
    String _path = _filePath != '' &&
            _filePath != null &&
            (_filePath.contains(".png") ||
                _filePath.contains('.jpg') ||
                _filePath.contains('.jpeg'))
        ? _filePath
        : AppConstant.defaultImage;
    return _path;
  }

  // 推荐商品
  Widget _recProductListWidget() {
    var itemWidth = (ScreenAdapter.getScreenWidth() - 30) / 2;
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: this._fileDetailList.map((detail) {
          return InkWell(
            onTap: () {
              Map argumentsMap = {
                "id": "${detail.id}",
                "_keywords": "",
                "vehicleBrandId": "",
              };
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductContentPage(arguments: argumentsMap),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: itemWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Image.network(
                      _filePath(detail.filePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                    child: Text(
                      "${detail.fileName}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "¥${detail.id.toString()}",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "¥${detail.fileId.toString()}",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _recProductListWidget2() {
    var itemWidth = (ScreenAdapter.getScreenWidth() - 50) / 2;

    List<FileDetail> _fileDetailList1 = [];
    List<FileDetail> _fileDetailList2 = [];
    if (_fileDetailList.length > 0) {
      for (int index = 0; index < _fileDetailList.length; index++) {
        // 偶数 从0开始
        if (index.isEven) {
          _fileDetailList1.add(_fileDetailList[index]);
        } else {
          _fileDetailList2.add(_fileDetailList[index]);
        }
      }
    }
    print('_fileDetailList: ' + _fileDetailList.length.toString());
    print('_fileDetailList1: ' + _fileDetailList1.length.toString());
    print('_fileDetailList2: ' + _fileDetailList2.length.toString());

    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: ScreenAdapter.getScreenWidth(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _fileDetailList1.map((detail) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: itemWidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            _filePath(detail.filePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenAdapter.height(20)),
                          child: Text(
                            "${detail.fileName}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenAdapter.height(20),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "¥${detail.id.toString()}",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "¥${detail.fileId.toString()}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: ScreenAdapter.getScreenWidth(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _fileDetailList2.map((detail) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: itemWidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            _filePath(detail.filePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenAdapter.height(20),
                          ),
                          child: Text(
                            "${detail.fileName}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenAdapter.height(20)),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "¥${detail.id.toString()}",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "¥${detail.fileId.toString()}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        )
      ],
    );

    ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    // 扩展方式，horizontal - 横向堆砌 , vertical - 垂直
                    direction: Axis.vertical,
                    runSpacing: 10,
                    spacing: 10,
                    children: _fileDetailList1.map((detail) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        width: itemWidth,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              child: Image.network(
                                _filePath(detail.filePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(20)),
                              child: Text(
                                "${detail.fileName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(20)),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "¥${detail.id.toString()}",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "¥${detail.fileId.toString()}",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Column(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    // 扩展方式，horizontal - 横向堆砌 , vertical - 垂直
                    direction: Axis.vertical,
                    runSpacing: 10,
                    spacing: 10,
                    children: _fileDetailList2.map((detail) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        width: itemWidth,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              child: Image.network(
                                _filePath(detail.filePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(20)),
                              child: Text(
                                "${detail.fileName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(20)),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "¥${detail.id.toString()}",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "¥${detail.fileId.toString()}",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
//        _swiperWidget(),
//        SizedBox(height: ScreenAdapter.height(10)),
//        _titleWidget("猜你喜欢"),
//        _hotProductListWidget(),
//        _titleWidget("热门推荐"),
//        _recProductListWidget(),
//      ],
//    );
    return _recProductListWidget2();
  }
}
