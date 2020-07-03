import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/product_detail.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';

class Single_prod extends StatelessWidget {
  final Product bookObject;

  Single_prod(
      {this.bookObject});

  @override
  Widget build(BuildContext context) {
    String title = bookObject.name.length > 16.5
        ? bookObject.name.substring(0, 15) + "..."
        : bookObject.name;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product : bookObject)));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 220,
                  width: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        bookObject.image,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  bookObject.author,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                '${bookObject.price}đ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 12,
                ),
                Text(bookObject.old_price + 'đ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w300))
              ],
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}

//
//class Single_prod_Pages extends StatelessWidget {
//
//  final Product bookObject;
//
//  Single_prod_Pages(
//      {
//      this.bookObject});
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: GestureDetector(
//        onTap: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) =>
//                      Details(product: bookObject)));
//        },
//        child: Container(
//          padding: EdgeInsets.all(10),
//          child: Row(
//            children: <Widget>[
//              Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Container(
//                    height: 210,
//                    width: 150,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(5.0)),
//                    child: ClipRRect(
//                        borderRadius: BorderRadius.circular(5.0),
//                        child: Image.asset(
//                          bookObject.image,
//                          fit: BoxFit.fill,
//                        )),
//                  ),
//                  Padding(padding: EdgeInsets.all(5),),
//                  Expanded(
//                    child: Text(
//                      bookObject.name,
//                      style: TextStyle(
//                          fontSize: 20,
//                          color: Colors.black87,
//                          fontWeight: FontWeight.w600),
//                    ),
//                  ),
////                  SizedBox(
////                    height: 7,
////                  ),
//                  Expanded(
//                    child: Text(
//                      bookObject.author,
//                      style: TextStyle(
//                        fontSize: 15,
//                        color: Colors.black45,
//                        fontWeight: FontWeight.w300,
//                      ),
//                      softWrap: true,
//                    ),
//                  ),
////                  SizedBox(
////                    height: 12,
////                  ),
//                  Expanded(
//                    child: Text(bookObject.price + 'đ',
//                        style: TextStyle(
//                            fontSize: 15,
//                            color: Colors.black,
//                            fontWeight: FontWeight.w500)),
//                  ),
////                  SizedBox(
////                    height: 12,
////                  ),
//                  Expanded(
//                    child: Text(bookObject.old_price + 'đ',
//                        style: TextStyle(
//                            fontSize: 13,
//                            color: Colors.black,
//                            decoration: TextDecoration.lineThrough,
//                            fontWeight: FontWeight.w300)),
//                  ),
//                ],
//              ),
////              SizedBox(
////                width: 20,
////              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
