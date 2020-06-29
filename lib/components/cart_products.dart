import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "ten": "Đắc nhân tâm",
      "picture": "images/products/p2.jpg",
      "soluong" : 2,
      "gia": 100000,
    },
    {
      "ten": "Bố già",
      "picture": "images/products/p1.jpg",
      "soluong" : 2,
      "gia": 100000,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_cart_product(
          cart_prod_ten: Products_on_the_cart[index]['ten'],
          cart_prod_picture:Products_on_the_cart[index]['picture'],
          cart_prod_soluong:Products_on_the_cart[index]['soluong'] ,
          cart_prod_gia:Products_on_the_cart[index]['gia'] ,
        );
      }
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_ten;
  final cart_prod_picture;
  final cart_prod_soluong;
  final cart_prod_gia;


  Single_cart_product({this.cart_prod_ten, this.cart_prod_picture,
      this.cart_prod_soluong, this.cart_prod_gia});

  @override
  Widget build(BuildContext context) {
    return Card(
       child: ListTile(
         leading: Image.asset(cart_prod_picture, width: 80, height: 150,),
         title: Text(cart_prod_ten, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
         subtitle: Column(
           children: <Widget>[
             SizedBox(height: 10),
             new Container(
               alignment: Alignment.topLeft,
               child : Text('\$${cart_prod_gia}', style: TextStyle(fontSize: 16, color: Colors.redAccent),)
             ),
             Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(8, 8, 18, 8),),
                    IconButton(icon : Icon(Icons.arrow_drop_up), onPressed: (){cart_prod_soluong +1;},),
                    Text('${cart_prod_soluong}'),
                    IconButton(icon : Icon(Icons.arrow_drop_down), onPressed: (){},)
                  ],
                ),
           ],
         ),
       ),
    );
  }
}
