import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';


class Popular_products extends StatefulWidget {
  @override
  _Popular_productsState createState() => _Popular_productsState();
}

class _Popular_productsState extends State<Popular_products> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<Product> product_popular_list = productProvider.products;
    return Container(
      padding: EdgeInsets.all(13),
      height: 380,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product_popular_list.length,
        itemBuilder: (BuildContext context, int index) {
          String title = product_popular_list[index].name.length > 16
              ? product_popular_list[index].name.substring(0, 15) + "..."
              : product_popular_list[index].name;
          return Single_prod(
            bookObject: product_popular_list[index],
          );
        },
      ),
    );
  }
}
