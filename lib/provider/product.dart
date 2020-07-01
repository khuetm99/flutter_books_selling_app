//import 'package:flutter/material.dart';
//import 'package:flutterbooksellingapp/helpers/product.dart';
//import '../models/products.dart';
//
//class ProductProvider with ChangeNotifier{
//  ProductServices _productServices = ProductServices();
//  List<Product> products = [];
//  List<Product> productsByCategory = [];
//  List<Product> productsSearched = [];
//
//
//  ProductProvider.initialize(){
//    loadProducts();
//  }
//
//  loadProducts()async{
//    products = await _productServices.getProducts();
//    notifyListeners();
//  }
//
//  Future loadProductsByCategory({String categoryName})async{
//    productsByCategory = await _productServices.getProductsOfCategory(category: categoryName);
//    notifyListeners();
//  }
//
//
//  Future search({String productName})async{
//    productsSearched = await _productServices.searchProducts(productName: productName);
//    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
//    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
//    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
//
//    notifyListeners();
//  }
//
//
//}