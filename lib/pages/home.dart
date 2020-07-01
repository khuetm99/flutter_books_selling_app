import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterbooksellingapp/components/horizontal_listview.dart';
import 'package:flutterbooksellingapp/components/horizontal_listview.dart';
import 'file:///D:/flutter_books_selling_app/lib/pages/new_book.dart';
import 'package:flutterbooksellingapp/components/products_show.dart';
import 'package:flutterbooksellingapp/pages/cart.dart';

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
        backgroundColor: Colors.green[700],
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
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()))),
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
                color: Colors.green[700],
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
            child: Text('Danh mục', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600), ),
          ),

          // Horizontal ListView
          HorizontalList(),

          //Sách nổi bật
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Sách nổi bật',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600), ),
          ),
          Popular_products(),

//            Sách mới
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Sách mới',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          ),
          NewBook(),

          //New Book
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Sách mua nhiều'),
          ),

//          NewBook(),

          //Flash Sale

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
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
        autoplayDuration:Duration(milliseconds: 4000) ,
        dotSize: 2.0,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
      ));
}
