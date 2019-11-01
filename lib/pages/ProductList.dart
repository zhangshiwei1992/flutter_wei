import 'package:flutter/material.dart';
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
  List<FileDetail> _fileDetailList = [];
  String _defaultImage =
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719486988&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=VqVKTd%2B8Ojh6EuQhRaKdXR0v5Nw%3D";

  @override
  void initState() {
    super.initState();
    _getFileDetailList();
  }

  _getFileDetailList() async {
    print(widget.arguments);
    Result result = await dioPost("/fileDetail/findList",
        {'businessCode': widget.arguments['orderCode']});
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

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      // body:Text("${widget.arguments}")

      body: _fileDetailList.length > 0
          ? Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: _fileDetailList.length,
                itemBuilder: (context, index) {
                  //每一个元素
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: ScreenAdapter.width(180),
                            height: ScreenAdapter.height(180),
                            child: Image.network(
                                _fileDetailList[index].filePath != '' &&
                                        _fileDetailList[index].filePath !=
                                            null &&
                                        _fileDetailList[index]
                                            .filePath
                                            .contains(".png")
                                    ? _fileDetailList[index].filePath
                                    : _defaultImage,
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: ScreenAdapter.height(180),
                              margin: EdgeInsets.only(left: 10),
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_fileDetailList[index].fileName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: ScreenAdapter.height(36),
                                        margin: EdgeInsets.only(right: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),

                                        //注意 如果Container里面加上decoration属性，这个时候color属性必须得放在BoxDecoration
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromRGBO(
                                              230, 230, 230, 0.9),
                                        ),

                                        child: Text(_fileDetailList[index]
                                            .id
                                            .toString()),
                                      ),
                                      Container(
                                        height: ScreenAdapter.height(36),
                                        margin: EdgeInsets.only(right: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromRGBO(
                                              230, 230, 230, 0.9),
                                        ),
                                        child: Text(_fileDetailList[index]
                                            .fileId
                                            .toString()),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _fileDetailList[index].fileCode,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(height: 20)
                    ],
                  );
                },
              ),
            )
          : Text("加载中...."),
    );
  }
}
