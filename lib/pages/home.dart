import 'package:badges/badges.dart';
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
import 'package:flutterbooksellingapp/pages/order_page.dart';
import 'package:flutterbooksellingapp/pages/product_search.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import 'category_page.dart';
import 'file:///D:/flutter_books_selling_app/lib/pages/new_book.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/pages/cart.dart';
import 'package:flutterbooksellingapp/pages/popular_books.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        actions: <Widget>[
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
//      app.isLoading ? Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[Loading()],
//        ),
//      ) :
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
            Divider(),
            SizedBox(
              height: 10,
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

            //Sách nổi bật
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sách nổi bật',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600), ),
            ),

            Popular_products(),


//            Sách mới
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sách mới',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
            ),
            NewBook(),

            //New Book
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text :'Sách mua nhiều', size : 22 , weight: FontWeight.w300,),
            ),
//          NewBook(),



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
}

//
//
//class ShoppingCartWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider.value(
//      value: HomeBloc.getInstance(
//        productRepo: Provider.of(context),
//        orderRepo: Provider.of(context),
//      ),
//      child: CartWidget(),
//    );
//  }
//}
//
//class CartWidget extends StatefulWidget {
//  @override
//  _CartWidgetState createState() => _CartWidgetState();
//}
//
//class _CartWidgetState extends State<CartWidget> {
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//
//    var bloc = Provider.of<HomeBloc>(context);
//    bloc.getShoppingCartInfo();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<HomeBloc>(
//      builder: (context, bloc, child) => StreamProvider<Object>.value(
//        value: bloc.shoppingCartStream,
//        initialData: null,
//        catchError: (context, error) {
//          return error;
//        },
//        child: Consumer<Object>(
//          builder: (context, data, child) {
//            if (data == null || data is RestError) {
//              return Container(
//                margin: EdgeInsets.only(top: 15, right: 20),
//                child: Icon(Icons.shopping_cart),
//              );
//            }
//
//            var cart = data as ShoppingCart;
//            return GestureDetector(
//              onTap: () {
//                if (data == null) {
//                  return;
//                }
//                Navigator.pushNamed(context, '/checkout',
//                    arguments: cart.orderId);
//              },
//              child: Container(
//                margin: EdgeInsets.only(top: 15, right: 20),
//                child: Badge(
//                  badgeContent: Text(
//                    '${cart.total}',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                  child: Icon(Icons.shopping_cart),
//                ),
//              ),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}

class ShoppingCart {
  String orderId;
  int total;

  ShoppingCart({this.orderId, this.total});

  factory ShoppingCart.fromJson(Map<String, dynamic> json) => ShoppingCart(
    orderId: json['orderId'] ?? '',
    total: json["total"] ?? 0,
  );
}
