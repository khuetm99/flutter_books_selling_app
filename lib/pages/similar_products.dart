import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';


class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.loadProductsByCategory(categoryName : 'Nổi Bật');
    return Container(
      padding: EdgeInsets.all(13),
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productProvider.productsByCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            bookObject: productProvider.productsByCategory[index],
          );
        },
      ),
    );
  }
}


class HotProducts extends StatefulWidget {
  @override
  _HotProductsState createState() => _HotProductsState();
}

class _HotProductsState extends State<HotProducts> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.loadProductsByRating(rating : '5');
    return Container(
      padding: EdgeInsets.all(13),
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productProvider.productsByRating.length,
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            bookObject: productProvider.productsByRating[index],
          );
        },
      ),
    );
  }
}
