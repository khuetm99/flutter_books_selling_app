import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/models/category.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/product_detail.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';



class CategoryScreen extends StatelessWidget {
  final Category categoryModel;

  const CategoryScreen({Key key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      )),
                  ClipRRect(
                    //                borderRadius: BorderRadius.only(
                    //                  bottomLeft: Radius.circular(30),
                    //                  bottomRight: Radius.circular(30),
                    //                ),
                    child: Image.asset(
                      categoryModel.image,
//                      placeholder: kTransparentImage,
                      height: 160,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      //                    borderRadius: BorderRadius.only(
                      //                      bottomLeft: Radius.circular(30),
                      //                      bottomRight: Radius.circular(30),
                      //                    ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        )),
                  ),
                  Positioned.fill(
                      bottom: 40,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            categoryModel.name,
                            style : TextStyle (
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w300,
                            )
                          ))),
                  Positioned.fill(
                      top: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.2)),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: productProvider.productsByCategory.map((item) => GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder : (context) => ProductDetails( product: item,)));
                  },
                  child: ProductWidget(product: item,),
                )).toList(),
              ),
            ],
          )),
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
                child: Image.asset(product.image, fit: BoxFit.fill,),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5,),
//                  ========================TÊN SẢN PHẨM==============================
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                           product.name,
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(1, 1),
                                    blurRadius: 4),
                              ]),
                        ),
                      )
                    ],
                  ),
//              =====================================TÁC GIẢ=================================
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.author,
                          style: TextStyle(fontSize: 15),
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
                              rating: double.parse('4.5'),
                              size: 20,
                              color: Colors.yellow.shade700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
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
                  SizedBox ( height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text( "${ product.price } vnđ",style : TextStyle (color : Colors.deepOrangeAccent, fontWeight: FontWeight.bold, fontSize: 18),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text( "${ product.old_price } vnđ",style : TextStyle (fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough),),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
