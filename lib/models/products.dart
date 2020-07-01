import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
//  static const ID = "id";
//  static const NAME = "name";
//  static const RATING = "rating";
//  static const NXB = "nxb";
//  static const IMAGE = "image";
//  static const PRICE = "price";
//  static const OLD_PRICE = "old_price";
//  static const DESCRIPTION = "description";
//  static const CATEGORY = "category";

  String id;
  String name;
  String author;
  String category;
  String image;
  String description;
  String nxb;

  double rating;
  String price;
  String old_price;


  Product({this.id, this.name,this.author, this.category, this.image, this.description,
      this.nxb, this.rating, this.price, this.old_price});


//  Product.fromSnapshot(DocumentSnapshot snapshot) {
//    id = snapshot.data[ID];
//    image = snapshot.data[IMAGE];
//    description = snapshot.data[DESCRIPTION];
//    id = snapshot.data[ID];
//    price = snapshot.data[PRICE];
//    category = snapshot.data[CATEGORY];
//    rating = snapshot.data[RATING];
//    name = snapshot.data[NAME];
//    nxb = snapshot.data[NXB];
//    oldprice = snapshot.data[OLD_PRICE];
//  }

}
