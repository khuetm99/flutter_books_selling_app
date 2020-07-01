import 'package:flutter/material.dart';
import 'file:///D:/flutter_books_selling_app/lib/pages/product_detail.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';



class Single_prod extends StatelessWidget {
  final product_ten;
  final product_tacgia;
  final product_picture;
  final product_giacu;
  final product_gia;
  final Product bookObject;

  Single_prod(
      {this.product_ten,
      this.product_tacgia,
      this.product_picture,
      this.product_giacu,
      this.product_gia,
      this.bookObject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(bookObject: bookObject)));
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
                        product_picture,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  product_ten,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  product_tacgia,
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
                Text(product_gia + 'đ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 12,
                ),
                Text(product_giacu + 'đ',
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
