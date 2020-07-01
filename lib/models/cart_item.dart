import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
//  static const ID = "id";
//  static const NAME = "name";
//  static const IMAGE = "image";
//  static const PRODUCT_ID = "productId";
//  static const QUANTITY = "quantity";
//  static const PRICE = "price";


  String id;
  String name;
  String image;
  String productId;
  int quantity;
  int price;

  CartItemModel({this.id, this.name, this.image, this.productId, this.quantity,
      this.price});

//  CartItemModel.fromMap(Map data){
//    _id = data[ID];
//    _name =  data[NAME];
//    _image =  data[IMAGE];
//    _productId = data[PRODUCT_ID];
//    _price = data[PRICE];
//    _quantity = data[QUANTITY];
//  }
//
//  Map toMap() => {
//    ID: _id,
//    IMAGE: _image,
//    NAME: _name,
//    PRODUCT_ID: _productId,
//    QUANTITY: _quantity,
//    PRICE: _price
//  };


}
