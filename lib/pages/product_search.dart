import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/helpers/screen_navigation.dart';
import 'package:flutterbooksellingapp/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/pages/product_detail.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.close), onPressed: (){
          Navigator.pop(context);
        }),
        title: Text ("Products", style: TextStyle(fontSize: 20),),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){changeScreen(context, CartScreen());})
        ],
      ),
      body: productProvider.productsSearched.length < 1? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search, color: Colors.grey, size: 30,),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text( "No products Found", style : TextStyle (color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 22,)),
            ],
          )
        ],
      ) : ListView.builder(
          itemCount: productProvider.productsSearched.length,
          itemBuilder: (context, index){
            return GestureDetector(
                onTap: ()async{
                  Navigator.push(context, MaterialPageRoute(builder : (context) => ProductDetails(product : productProvider.productsSearched[index])));
                },
                child: ProductWidget( product : productProvider.productsSearched[index]));
          }),
    );
  }
}
