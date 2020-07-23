import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/custom_text.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:flutterbooksellingapp/helpers/screen_navigation.dart';
import 'package:flutterbooksellingapp/helpers/style.dart';
import 'package:flutterbooksellingapp/pages/home.dart';
import 'package:flutterbooksellingapp/pages/registration_page.dart';
import 'package:flutterbooksellingapp/pages/splash_screen.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo/logo_book.png", width: 200, height: 200,),
              ],
            ),

            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        icon: Icon(Icons.email)
                    ),
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock)
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () async{
                  if(!await authProvider.signIn()){
                    _key.currentState.showSnackBar(
                        SnackBar(content: Text("Login failed!"))
                    );
                    return;
                  }
                  categoryProvider.loadCategories();
                  productProvider.loadProducts();
                  authProvider.userModel.getTotalQuantity();
                  authProvider.clearController();
                  changeScreenReplacement(context, SpashScreenPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xffff5f6d),
                        Color(0xffff5f6d),
                        Color(0xffffc371),
                      ],
                    ),
                  ),
                  child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(text: "Login", color: white, size: 22, weight: FontWeight.w600,)
                      ],
                    ),),
                ),
              ),
            ),

            SizedBox(height: screenHeight/3.2,),

            GestureDetector(
              onTap: (){
                changeScreen(context, RegistrationScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("I'm a new user.",style: TextStyle(fontSize : 19, fontWeight: FontWeight.bold),),
                  CustomText(text: " Register here", size: 19, weight: FontWeight.bold, color: Color(0xffff5f6d)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
