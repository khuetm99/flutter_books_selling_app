import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),

//      ================body===================
      body: Cart_products(),


//    ==============bottom navigation===========
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
                  title: Text('Tổng tiền : '),
                  subtitle: Text('\$2300000'),
            )),
            Expanded(child: MaterialButton(
              onPressed: () {},
              child: Text('Thanh toán', style: TextStyle(color: Colors.white),),
              color: Colors.redAccent,
            )),
          ],
        ),
      ),
    );
  }
}
