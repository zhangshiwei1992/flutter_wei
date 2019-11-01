import 'package:flutter/material.dart';

class LoadingWidget {
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
}
