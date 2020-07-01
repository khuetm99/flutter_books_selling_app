import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const ID = "id";
  static const AUTHOR = "author";
  static const NAME = "name";
  static const RATING = "rating";
  static const NXB = "nxb";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const OLD_PRICE = "old_price";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";

//  String _id;
//  String _name;
//  String _author;
//  String _category;
//  String _image;
//  String _description;
//  String _nxb;
//
//  double _rating;
//  String _price;
//  String _old_price;

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


//  String get name => _name;
//
//  String get author => _author;
//
//  String get category => _category;
//
//  String get image => _image;
//
//  String get description => _description;
//
//  String get nxb => _nxb;
//
//  double get rating => _rating;
//
//  String get price => _price;
//
//  String get old_price => _old_price;
//
//  String get id => _id;


    Product({this.id, this.name,this.author, this.category, this.image, this.description,
      this.nxb, this.rating, this.price, this.old_price});


//  Product.fromSnapshot(DocumentSnapshot snapshot) {
//    _id = snapshot.data[ID];
//    _author = snapshot.data[AUTHOR];
//    _image = snapshot.data[IMAGE];
//    _description = snapshot.data[DESCRIPTION];
//    _price = snapshot.data[PRICE];
//    _category = snapshot.data[CATEGORY];
//    _rating = snapshot.data[RATING];
//    _name = snapshot.data[NAME];
//    _nxb = snapshot.data[NXB];
//    _old_price = snapshot.data[OLD_PRICE];
//  }

}
