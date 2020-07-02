import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'components/single_category.dart';
import 'components/single_category.dart';
import 'components/single_product.dart';
import 'package:flutterbooksellingapp/pages/cart.dart';
import 'package:flutterbooksellingapp/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider( providers : [ChangeNotifierProvider.value(value: CategoryProvider.initialize())],
      child:
      MaterialApp(
        home: HomePage(),
      )
      ));
}
