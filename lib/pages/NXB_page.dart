import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/helpers/screen_navigation.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/cart_page.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import 'package:provider/provider.dart';

class nxbPage extends StatefulWidget {
  final Product product;

  nxbPage({this.product});

  @override
  _nxbPageState createState() => _nxbPageState();
}

class _nxbPageState extends State<nxbPage> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          widget.product.nxb,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Badge(
              position: BadgePosition.topRight(top: 0, right: 3),
              badgeContent: Text(
                '${user.userModel.totalQuantity.toString()}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, CartScreen());
                },
              ),
            ),
          ),
        ],
      ),
      body :  GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height ) ,
        ),
        itemCount: productProvider.productsByNXB.length,
        itemBuilder: (context, index) {
          return Single_prod_Card(
            bookObject: productProvider.productsByNXB[index],
          );
        },
      ),
    );
  }
}
