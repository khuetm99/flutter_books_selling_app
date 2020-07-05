import 'dart:async';
import 'package:badges/badges.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterbooksellingapp/components/custom_text.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:flutterbooksellingapp/components/single_category.dart';
import 'package:flutterbooksellingapp/components/single_category.dart';
import 'package:flutterbooksellingapp/helpers/screen_navigation.dart';
import 'package:flutterbooksellingapp/helpers/style.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/cart_page.dart';
import 'package:flutterbooksellingapp/pages/category_search.dart';
import 'package:flutterbooksellingapp/pages/login.dart';
import 'package:flutterbooksellingapp/pages/new_book.dart';
import 'package:flutterbooksellingapp/pages/order_page.dart';
import 'package:flutterbooksellingapp/pages/product_search.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import 'category_page.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/pages/popular_books.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key : key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//  ===================================NOTIFICATION SETTING======================================
  int _SelectedIndex = 0;
  bool _newNotification = false;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final TextEditingController _topicController =
  TextEditingController(text: 'topic');

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        setState(() {
          _newNotification = true;
          _showItemDialog(message);
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _navigateToItemDetail(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    //Getting the token from FCM
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
       print( "DEVICE TOKEN : \n\n $token");
      });
      _firebaseMessaging.subscribeToTopic("matchscore");
    });

  }


//========================== UI HOMEPAGE=====================================================
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: primary,
        title: CustomText(
          text: "BooksApp",
          color: white,
        ),
        centerTitle: true,
        actions: <Widget>[
//          Stack(
//            children: <Widget>[
//              IconButton(
//                icon: _newNotification
//                    ? Stack(
//                  children: <Widget>[
//                    Icon(Icons.notifications),
//                    Positioned(
//                      right: 0,
//                      child: Container(
//                        padding: EdgeInsets.all(1),
//                        decoration: BoxDecoration(
//                          color: Colors.red,
//                          borderRadius: BorderRadius.circular(15),
//                        ),
//                        constraints: BoxConstraints(
//                          minWidth: 13,
//                          minHeight: 13,
//                        ),
//                      ),
//                    )
//                  ],
//                ) : Icon(Icons.notifications),
//                onPressed: () {
//                     setState(() {
//                       _newNotification = false;
//                     });
//                },
//              ),
//            ],
//          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, CartScreen());
                },
              ),
            ],
          ),
        ],
      ),
//      =====================================DRAWER===========================================
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primary),
              accountName: CustomText(
                text: user.userModel?.name ?? "username lading...",
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: user.userModel?.email ?? "email loading...",
                color: white,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: "Home"),
            ),
            ListTile(
              onTap: () async{
                await user.getOrders();
                changeScreen(context, OrdersScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartScreen());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart"),
            ),
            ListTile(
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "Log out"),
            ),
          ],
        ),
      ),
      backgroundColor: white,
//      =========================================BODY==========================================
      body:
      app.isLoading ? Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Loading()],
        ),
      ) :
      SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: red,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern)async{
                        app.changeLoading();
                        if(app.search == SearchBy.PRODUCTS){
                          await productProvider.search(productName: pattern);
                          changeScreen(context, ProductSearchScreen());
                        }else{
                          await categoryProvider.search(name: pattern);
                          changeScreen(context, CategoriesSearchScreen());
                        }
                        app.changeLoading();
                      },
                      decoration: InputDecoration(
                        hintText: "Tìm kiếm sách và danh mục",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomText(text: "Tìm kiếm theo:", color: grey, weight: FontWeight.w300,),
                DropdownButton<String>(
                  value: app.filterBy,
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w300
                  ),
                  icon: Icon(Icons.filter_list,
                    color: primary,),
                  elevation: 0,
                  onChanged: (value){
                    if (value == "Products"){
                      app.changeSearchBy(newSearchBy: SearchBy.PRODUCTS);
                    }else{
                      app.changeSearchBy(newSearchBy: SearchBy.CATEGORIES);
                    }
                  },
                  items: <String>["Products", "Categories"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value));
                  }).toList(),

                ),
              ],
            ),

//            ===================CAROSEL IMAGE===============
            image_carousel,
            // padding widget
            new Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text('Danh mục', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600), ),
            ),

//          =====================CATETGORY LISTVIEW=====================
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await productProvider.loadProductsByCategory( categoryName: categoryProvider.categories[index].name);
                        Navigator.push(context, MaterialPageRoute(builder : (context) => CategoryScreen( categoryModel: categoryProvider.categories[index],)));
                            },
                      child: Single_category_list(
                        category_object: categoryProvider.categories[index],
                      ),
                    );
                  }), ),
                  Divider(),
            //Sách nổi bật
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Gợi ý cho bạn ',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600), ),
            ),

            Popular_products(),

//            Divider(),
//
////            Sách mới
//            new Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text('Sách mới',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
//            ),
//              NewBook(),
//


          ],
        ),
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




//============================================NOTIFICATION FUNCTION==============================
  Widget _buildDialog(BuildContext context, Item item) {
    return AlertDialog(
      content: Text('''Title : ${item.title}  Message: ${item.message}'''),
      actions: <Widget>[
        FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: const Text('SHOW'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }


  void _showItemDialog(Map<String, dynamic> message) {
    showDialog<bool>(
      context: context,
      builder: (_) => _buildDialog(context, _itemForMessage(message)),
    ).then((bool shouldNavigate) {
      if (shouldNavigate == true) {
        _navigateToItemDetail(message);
      }
    });
  }

  void _navigateToItemDetail(Map<String, dynamic> message) {
    final Item item = _itemForMessage(message);
    // Clear away dialogs
    Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
    if (!item.route.isCurrent) {
      Navigator.push(context, item.route);
    }
  }
}
//================================END STateFull HOMEPAGE=============================


Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

final Map<String, Item> _items = <String, Item>{};
Item _itemForMessage(Map<String, dynamic> message) {
  final dynamic data = message['data'] ?? message;
  final String itemId = data['id'];
  final Item item = _items.putIfAbsent(itemId, () => Item(itemId: itemId))
    .._title = data['title']
    .._message = data['message'];
  return item;
}

class Item {
  Item({this.itemId});
  final String itemId;

  StreamController<Item> _controller = StreamController<Item>.broadcast();
  Stream<Item> get onChanged => _controller.stream;

  String _title;
  String get title => _title;
  set title(String value) {
    _title = value;
    _controller.add(this);
  }

  String _message;
  String get message => _message;
  set message(String value) {
    _message = value;
    _controller.add(this);
  }

  static final Map<String, Route<void>> routes = <String, Route<void>>{};
  Route<void> get route {
    final String routeName = '/detail/$itemId';
    return routes.putIfAbsent(
      routeName,
          () => MaterialPageRoute<void>(
        settings: RouteSettings(name: routeName),
        builder: (BuildContext context) => DetailPage(itemId),
      ),
    );
  }
}


//==================================================NOTIFICATION PAGE===========================================
class DetailPage extends StatefulWidget {
  DetailPage(this.itemId);
  final String itemId;
  @override
  _DetailPageState createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  Item _item;
  StreamSubscription<Item> _subscription;

  @override
  void initState() {
    super.initState();
    _item = _items[widget.itemId];
    _subscription = _item.onChanged.listen((Item item) {
      if (!mounted) {
        _subscription.cancel();
      } else {
        setState(() {
          _item = item;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Notification"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Today title:', style: TextStyle(fontSize : 22 , color: Colors.black.withOpacity(0.8))),
                          Text( _item.title, style: Theme.of(context).textTheme.title)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Message:', style: TextStyle(fontSize : 22 , color: Colors.black.withOpacity(0.8))),
                          Text( _item.message, style: Theme.of(context).textTheme.title)
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}







