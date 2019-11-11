import 'package:flutter/material.dart';
import 'package:flutter_wei/pages/ProductContent.dart';
import 'package:flutter_wei/pages/ProductList.dart';
import 'package:flutter_wei/pages/Search.dart';
import 'package:flutter_wei/pages/tabs/Cart.dart';
import 'package:flutter_wei/pages/tabs/User.dart';

import '../pages/tabs/Tabs.dart';

class AppRoutes {
  static genAllRoutes(BuildContext context) {
    Map<String, WidgetBuilder> map = {
      Tabs.routerName: (context) {
        return Tabs();
      },
      CartPage.routerName: (context) {
        return CartPage();
      },
      UserPage.routerName: (context) {
        return UserPage();
      },
      ProductListPage.routerName: (context) {
        return ProductListPage();
      },
      ProductContentPage.routerName: (context) {
        return ProductContentPage();
      },
      SearchPage.routerName: (context) {
        return SearchPage();
      },
    };
    return map;
  }
}
