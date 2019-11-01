import 'package:flutter/material.dart';
import 'package:flutter_wei/config/ScreenAdaper.dart';
import 'package:flutter_wei/constants/Result.dart';
import 'package:flutter_wei/model/CapitalDetail.dart';
import 'package:flutter_wei/model/Order.dart';
import 'package:flutter_wei/utils/HttpUtils.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String _defaultImage =
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000017_GPS_O_15638127740000000741_0.png?Expires=4719486397&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=TB6sctRhQnUltL1qy6tOPEbvavE%3D";

  int _selectIndex = 0;
  List _capitalDetailList = [];
  List _orderList = [];

  @override
  void initState() {
    super.initState();
    _getLeftCateData();
  }

  //左侧分类
  _getLeftCateData() async {
    Result result = await dioPost("/capitalDetail/findList", {});
    setState(() {
      _capitalDetailList = [];
      if (result.success) {
        if (result.value != null) {
          result.value.forEach((capitalDetail) {
            _capitalDetailList.add(CapitalDetail.fromJson(capitalDetail));
          });
        }
      }
    });
    _getRightCateData(_capitalDetailList[0].capitalCode);
  }

  //右侧分类
  _getRightCateData(capitalCode) async {
    Result result =
        await dioPost("/order/findList", {"capitalSide": capitalCode});
    setState(() {
      _orderList = [];
      if (result.success) {
        if (result.value != null) {
          result.value.forEach((order) {
            _orderList.add(Order.fromJson(order));
          });
        }
      }
    });
  }

  Widget _leftCateWidget(leftWidth) {
    if (this._capitalDetailList.length > 0) {
      return Container(
        width: leftWidth,
        height: double.infinity,
        child: ListView.builder(
          itemCount: this._capitalDetailList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectIndex = index;
                      this._getRightCateData(
                          this._capitalDetailList[index].capitalCode);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: ScreenAdapter.height(84),
                    padding: EdgeInsets.only(top: ScreenAdapter.height(24)),
                    child: Text("${this._capitalDetailList[index].capitalName}",
                        textAlign: TextAlign.center),
                    color: _selectIndex == index
                        ? Color.fromRGBO(240, 246, 246, 0.9)
                        : Colors.white,
                  ),
                ),
                Divider(height: 1),
              ],
            );
          },
        ),
      );
    } else {
      return Container(width: leftWidth, height: double.infinity);
    }
  }

  Widget _rightCateWidget(rightItemWidth, rightItemHeight) {
    if (this._orderList.length > 0) {
      return Expanded(
        flex: 1,
        child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: rightItemWidth / rightItemHeight,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: this._orderList.length,
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network("${_defaultImage}",
                            fit: BoxFit.cover),
                      ),
                      Container(
                        height: ScreenAdapter.height(28),
                        child: Text("${this._orderList[index].orderCode}"),
                      )
                    ],
                  ),
                );
              },
            )),
      );
    } else {
      return Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: Text("加载中..."),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //注意用ScreenAdapter必须得在build方法里面初始化
    ScreenAdapter.init(context);

    //左侧宽度
    var leftWidth = ScreenAdapter.getScreenWidth() / 4;
    //右侧每一项宽度=（总宽度-左侧宽度-GridView外侧元素左右的Padding值-GridView中间的间距）/3
    var rightItemWidth =
        (ScreenAdapter.getScreenWidth() - leftWidth - 20 - 20) / 3;
    //获取计算后的宽度
    rightItemWidth = ScreenAdapter.width(rightItemWidth);
    //获取计算后的高度
    var rightItemHeight = rightItemWidth + ScreenAdapter.height(28);

    return Row(
      children: <Widget>[
        _leftCateWidget(leftWidth),
        _rightCateWidget(rightItemWidth, rightItemHeight)
      ],
    );
  }
}
