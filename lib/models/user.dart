import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterbooksellingapp/models/cart_item.dart';
import 'package:flutterbooksellingapp/models/products.dart';

class UserModel{
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";
  static const FAVORITE = "favorite";

  String _name;
  String _email;
  String _id;
  String _stripeId;
  int _priceSum = 0;
  int _quantitySum = 0;


//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;

//  public variable
  List cart;
  int totalCartPrice;
  int totalQuantity= 0;
  List<Product> favorite;


  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID];
    cart = snapshot.data[CART] ?? [];
    favorite = snapshot.data[FAVORITE] ?? [];
    totalCartPrice = snapshot.data[CART] == null ? 0 :getTotalPrice(cart: snapshot.data[CART]);
    totalQuantity = snapshot.data[CART] == null ? 0 : getTotalQuantity(cart: snapshot.data[CART]);
  }

  int getTotalQuantity({List cart}){
    if(cart == null){
      return 0;
    }
    for(Map cartItem in cart){
      _quantitySum += cartItem["quantity"];
    }

    int total = _quantitySum;

    print("THE TOTAL QUANTITY IS $total");
    print("THE TOTAL QUANTITY IS $total");


    return total;
  }


  int getTotalPrice({List cart}){
    if(cart == null){
      return 0;
    }
    for(Map cartItem in cart){
      _priceSum += cartItem["price"] * cartItem["quantity"];
    }

    int total = _priceSum;

    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");

    return total;
  }

// List<CartItemModel> _convertCartItems(List<Map> cart){
//    List<CartItemModel> convertedCart = [];
//    for(Map cartItem in cart){
//      convertedCart.add(CartItemModel.fromMap(cartItem));
//    }
//    return convertedCart;
//  }
}