import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../config/ScreenAdaper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 轮播图
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];

    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                imgList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            itemCount: imgList.length,
            pagination: new SwiperPagination(),
            autoplay: true),
      ),
    );
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
    return Container(
      height: ScreenAdapter.height(234),
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: ListView.builder(
        // 水平滑动的listView
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return Column(
            children: <Widget>[
              Container(
                height: ScreenAdapter.height(140),
                width: ScreenAdapter.width(140),
                margin: EdgeInsets.only(right: ScreenAdapter.width(21)),
                child: Image.network(
                  "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: ScreenAdapter.height(10),
                ),
                height: ScreenAdapter.height(44),
                child: Text("第${index}条"),
              )
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }

  // 推荐商品
  _recProductItemWidget() {
    var itemWidth = (ScreenAdapter.getScreenWidth() - 30) / 2;
    return Container(
      padding: EdgeInsets.all(10),
      width: itemWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1),
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
                "https://www.itying.com/images/flutter/list1.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
              "2019夏季新款气质高贵洋气阔太太有女人味中长款宽松大码",
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
            children: <Widget>[
              _recProductItemWidget(),
              _recProductItemWidget(),
              _recProductItemWidget(),
              _recProductItemWidget(),
              _recProductItemWidget(),
              _recProductItemWidget()
            ],
          ),
        ),
      ],
    );
  }
}
