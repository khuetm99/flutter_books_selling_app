import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/product_detail.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';

List<Product> product_new_list = [
  Product(
    id: "42",
    name: "One Piece tập 92 ",
    author: "Masashi Kishimoto",
    image: "images/products/manga-comic/op92.jpg",
    old_price: '120,000',
    price: 20550,
    nxb: 'Tuoi tre',
    description: 'a',
  ),
  Product(
    name: "One Piece tập 92 ",
    author: "Masashi Kishimoto",
    image: "images/products/manga-comic/op92.jpg",
    old_price: '120,000',
    price: 20550,
    nxb: 'Tuoi tre',
    description: 'a',
  ),
] ;

class NewBook extends StatefulWidget {
  @override
  _NewBookState createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<Product> product_list = productProvider.productsByCategory;
    return Container(
      padding: EdgeInsets.all(13),
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product_new_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            bookObject: product_new_list[index],
          );
        },
      ),
    );
  }
}

