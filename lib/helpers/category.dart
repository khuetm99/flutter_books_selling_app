import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryServices {
  String collection = "categories";
  Firestore _firestore = Firestore.instance;

  Future<List<Category>> getCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Category> categories = [];
        for(DocumentSnapshot category in result.documents){
          categories.add(Category.fromSnapshot(category));
        }
        return categories;
      });
}

