import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterbooksellingapp/models/products.dart';

class FavoriteServices{
  String collection = "favorites";
  Firestore _firestore = Firestore.instance;

  void createFavorite({Product product, String userId}) {
    _firestore.collection(collection).document(product.id).setData({
      "userId": userId,
      "id": product.id,
      'name': product.name,
      'image': product.image,
      'category': product.category,
      'author': product.author,
      'nxb': product.nxb,
      'description': product.description,
      'rating':product.rating,
      'old_price': product.old_price,
      'price': product.price
  });
  }

  void deleteFavorite({String favoriteId}){
    _firestore.collection(collection).document(favoriteId).delete();
  }


  Future<List<Product>> getUserFavorites({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<Product> favorites = [];
        for (DocumentSnapshot order in result.documents) {
          favorites.add(Product.fromSnapshot(order));
        }
        return favorites;
      });

}