import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/products.dart';



//
//class ProductServices {
//  String collection = "products";
//  Firestore _firestore = Firestore.instance;
//
//  Future<List<Product>> getProducts() async =>
//      _firestore.collection(collection).getDocuments().then((result) {
//        List<Product> products = [];
//        for (DocumentSnapshot product in result.documents) {
//          products.add(Product.fromSnapshot(product));
//        }
//        return products;
//      });
//
//  Future<List<Product>> getProductsOfCategory({String category}) async =>
//      _firestore
//          .collection(collection)
//          .where("category", isEqualTo: category)
//          .getDocuments()
//          .then((result) {
//        List<Product> products = [];
//        for (DocumentSnapshot product in result.documents) {
//          products.add(Product.fromSnapshot(product));
//        }
//        return products;
//      });
//
//  Future<List<Product>> searchProducts({String productName}) {
//    // code to convert the first character to uppercase
//    String searchKey = productName[0].toUpperCase() + productName.substring(1);
//    return _firestore
//        .collection(collection)
//        .orderBy("name")
//        .startAt([searchKey])
//        .endAt([searchKey + '\uf8ff'])
//        .getDocuments()
//        .then((result) {
//      List<Product> products = [];
//      for (DocumentSnapshot product in result.documents) {
//        products.add(Product.fromSnapshot(product));
//      }
//      return products;
//    });
//  }
//}
//
