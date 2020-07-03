import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:flutterbooksellingapp/pages/login.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import 'components/single_category.dart';
import 'components/single_category.dart';
import 'components/single_product.dart';
import 'package:flutterbooksellingapp/pages/cart.dart';
import 'package:flutterbooksellingapp/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Books App',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController())));
}


class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomePage();
      default:
        return LoginScreen();
    }
  }
}
