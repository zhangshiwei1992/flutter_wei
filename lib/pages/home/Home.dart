import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wei/constants/Result.dart';
import 'package:flutter_wei/model/file/FileDetail.dart';
import 'package:flutter_wei/model/vehicle/VehicleBrand.dart';
import 'package:flutter_wei/utils/HttpUtils.dart';

import '../../config/ScreenAdaper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<VehicleBrand> _bBrandList = [];
  List<VehicleBrand> _jBrandList = [];
  List<FileDetail> _fileDetailList = [];
  String _defaultImage =
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000017_GPS_O_15638127740000000741_0.png?Expires=4719486397&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=TB6sctRhQnUltL1qy6tOPEbvavE%3D";
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
        "/fileDetail/findList", {'businessCode': 'VX15595590860000000009'});
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
        ? Container(
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    _bBrandList[index].logo != '' &&
                            _bBrandList[index].logo != null &&
                            _jBrandList[index].logo.contains(".png")
                        ? _bBrandList[index].logo
                        : _defaultImage,
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _bBrandList.length,
                pagination: new SwiperPagination(),
                autoplay: true,
              ),
            ),
          )
        : _loadingCircle(true);
  }

  // 加载中的圈圈
  Widget _loadingCircle(bool hasMore) {
    if (hasMore) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16),
              ),
              CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text('我是有底线的!'),
      );
    }
  }

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
              itemBuilder: (contxt, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: ScreenAdapter.height(140),
                      width: ScreenAdapter.width(140),
                      margin: EdgeInsets.only(right: ScreenAdapter.width(21)),
                      child: Image.network(
                        _jBrandList[index].logo != '' &&
                                _jBrandList[index].logo != null &&
                                _jBrandList[index].logo.contains(".png")
                            ? _jBrandList[index].logo
                            : _defaultImage,
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
        : _loadingCircle;
  }

  // 推荐商品
  List<Widget> _getWidgetList() {
    var itemWidth = (ScreenAdapter.getScreenWidth() - 30) / 2;
    return _fileDetailList.length > 0
        ? _fileDetailList.map(
            (detail) {
              return Container(
                padding: EdgeInsets.all(10),
                width: itemWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(233, 233, 233, 0.9), width: 1),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      // 设置此Container铺满外层组件
                      width: double.infinity,
                      child: AspectRatio(
                        // 防止服务器返回的图片大小不一致导致高度不一致问题
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          detail.filePath != null &&
                                  detail.filePath != '' &&
                                  (detail.filePath.contains('.jpg') ||
                                      detail.filePath.contains(".png") ||
                                      detail.filePath.contains(".jpeg"))
                              ? detail.filePath
                              : _defaultImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                      child: Text(
                        detail.fileName,
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
                              "¥188.0",
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "¥198.0",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ).toList()
        : _loadingCircle(true);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return ListView(
      children: <Widget>[
        _swiperWidget(),
        SizedBox(height: ScreenAdapter.height(10)),
        _titleWidget("猜你喜欢"),
        _hotProductListWidget(),
        _titleWidget("热门推荐"),
        Container(
          padding: EdgeInsets.all(10),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: _getWidgetList(),
          ),
        ),
      ],
    );
  }
}
