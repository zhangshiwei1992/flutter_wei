import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static final String routerName = "/cart";

  CartPage({Key key}) : super(key: key);

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Text("购物车页面");
  }
}
