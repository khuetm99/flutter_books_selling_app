import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'components/horizontal_listview.dart';

void main() {
  runApp(new MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text('BookApp'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
//            Home
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Khue'),
              accountEmail: Text('khueto199@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
              ),
              decoration: new BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
//              Body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Order'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Category'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favorite'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,

          // padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Category'),
          ),

          // Horizontal ListView
          HorizontalList(),

        ],
      ),
    );
  }

  Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/c2.png'),
          AssetImage('images/c3.jpg'),
          AssetImage('images/c4.jpg'),
          AssetImage('images/c3.jpg'),
          AssetImage('images/c4.jpg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 6.0,
      ));
}
