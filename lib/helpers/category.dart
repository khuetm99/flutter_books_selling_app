import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryServices {
  String collection = "categories";
  Firestore _firestore = Firestore.instance;

  Future<List<Category>> getCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Category> categories = [];
        for (DocumentSnapshot category in result.documents) {
          categories.add(Category.fromSnapshot(category));
        }
        return categories;
      });

  Future<List<Category>> searchCategory({String categoryName}) {
    // code to convert the first character to uppercase
    String searchKey = categoryName[0].toUpperCase() +
        categoryName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
      List<Category> categories = [];
      for (DocumentSnapshot product in result.documents) {
        categories.add(Category.fromSnapshot(product));
      }
      return categories;
    });
  }

}