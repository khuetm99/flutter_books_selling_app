import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterbooksellingapp/components/shimmer.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/product_detail.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child:  Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey[300],
                              child: ShimmerLayoutSingleProd(),
                              period: Duration(milliseconds: 800),
                            ),
                          )),
                          Image.network(
                            bookObject.image,
                            height: 220,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ],
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
                '${bookObject.price.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}đ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 12,
                ),
                Text(bookObject.old_price.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') + 'đ',
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


class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return  Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]
        ),
//            height: 160,
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child: Align(
                      alignment: Alignment.center,
                      child:  Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: Colors.grey[300],
                        child: ShimmerLayoutProductWidget(),
                        period: Duration(milliseconds: 800),
                      ),
                    )),
                    Image.network(product.image, height : 140, width: 150, fit: BoxFit.cover,),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
//                  ========================TÊN SẢN PHẨM==============================
                  Row(
//                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
//                      Padding(
//                        padding: EdgeInsets.all(8),
//                        child: Container(
//                          decoration: BoxDecoration(
//                              borderRadius:
//                              BorderRadius.circular(20),
//                              color: Colors.white,
//                              boxShadow: [
//                                BoxShadow(
//                                    color: Colors.grey[300],
//                                    offset: Offset(1, 1),
//                                    blurRadius: 4),
//                              ]),
//                        ),
//                      )
                    ],
                  ),
//              =====================================TÁC GIẢ=================================
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.author,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
//                  ============================RATING=============================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: StarRating(
                              rating: double.parse(product.rating),
                              size: 20,
                              color: Colors.yellow.shade700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0,0.0),
                            child: Text(
                                product.rating.toString(),
                                style : TextStyle(color: Colors.grey,
                                  fontSize: 14.0,)
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
//                  ========================================PRICE===================================
                  SizedBox ( height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text( "${ product.price.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') } vnđ",style : TextStyle (color : Colors.deepOrangeAccent, fontWeight: FontWeight.bold, fontSize: 18),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text( "${ product.old_price.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') } vnđ",style : TextStyle (fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough),),
                      ),
                    ],
                  ),
//                  SizedBox ( height: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



class Single_prod_Card extends StatelessWidget {

  final Product bookObject;

  Single_prod_Card(
      {
      this.bookObject});

  @override
  Widget build(BuildContext context) {
    String title = bookObject.name.length > 14
        ? bookObject.name.substring(0, 13) + "..."
        : bookObject.name;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(product: bookObject)));
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(child: Align(
                              alignment: Alignment.center,
                              child:  Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: Colors.grey[300],
                                child: ShimmerLayoutSingleProd(),
                                period: Duration(milliseconds: 800),
                              ),
                            )),
                            Image.network(
                              bookObject.image,
                              height: 250,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        )),
                  ),
                  Padding(padding: EdgeInsets.all(5),),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bookObject.author.length > 21 ?  bookObject.author.substring(0, 20) + "..." : bookObject.author,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Expanded(
                    child: Text(
                        '${bookObject.price.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}đ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ),
                  Expanded(
                    child: Text(bookObject.old_price.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') + 'đ',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
