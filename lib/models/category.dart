import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";

  String id;
  String name;
  String image;

//  int _id;
//  String _name;
//  String _image;


//  int get id => _id;
//
//  String get name => _name;
//
//  String get image => _image;

  Category({this.id, this.name, this.image});

  Category.fromSnapshot(DocumentSnapshot snapshot){
    id = snapshot.data[ID];
    name = snapshot.data[NAME];
    image = snapshot.data[IMAGE];
  }


}
