import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterbooksellingapp/models/products.dart';


class FavoriteModel {
  static const ID = "id";
  static const PRODUCT = "product";
  static const USER_ID = "userId";

  String id;
  String userId;

  // public variable
  Product product;


  FavoriteModel.fromSnapshot(DocumentSnapshot snapshot){
    id = snapshot.data[ID];
    userId = snapshot.data[USER_ID];
    product = snapshot.data[PRODUCT];
  }

}