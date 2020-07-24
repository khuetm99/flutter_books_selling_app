import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/pages/home.dart';
import 'package:splashscreen/splashscreen.dart';


class SpashScreenPage extends StatefulWidget {
  @override
  _SpashScreenPageState createState() => new _SpashScreenPageState();
}

class _SpashScreenPageState extends State<SpashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      seconds: 3,
      navigateAfterSeconds: HomePage(),
      image: new Image.asset(
          'images/splash/loading.gif'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.deepOrange,
    );
  }

}


