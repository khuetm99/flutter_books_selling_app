import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/helpers/order.dart';
import 'package:flutterbooksellingapp/helpers/style.dart';
import 'package:flutterbooksellingapp/pages/payment.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../helpers/screen_navigation.dart';
import 'home.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: Text( "Shopping Cart"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: app.isLoading ? Loading() : ListView.builder(
          itemCount: user.userModel.cart.length,
          itemBuilder: (_, index) {
            print("THE PRICE IS: ${user.userModel.cart[index]["price"]}");
            print("THE QUANTITY IS: ${user.userModel.cart[index]["quantity"]}");

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: red.withOpacity(0.2),
                          offset: Offset(3, 2),
                          blurRadius: 30)
                    ]),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        user.userModel.cart[index]["image"],
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: user.userModel.cart[index]["name"] + "\n",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "${user.userModel.cart[index]["price"].toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') }đ\n\n",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300)),
                                TextSpan(
                                    text: "Quantity: ",
                                    style: TextStyle(
                                        color: grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: user.userModel.cart[index]["quantity"].toString(),
                                    style: TextStyle(
                                        color: primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ]),
                            ),
                          ),
//                          ============================BUTTON REMOVE==========================
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: red,
                              ),
                              onPressed: ()async{
                                app.changeLoading();
                                bool value = await user.removeFromCart(cartItem: user.userModel.cart[index]);
                                if(value){
                                  user.reloadUserModel();
                                  print("Item was removed from cart");
                                  _key.currentState.showSnackBar(
                                      SnackBar(content: Text("Removed from Cart!"))
                                  );
                                  app.changeLoading();
                                  return;
                                }else{
                                  print("ITEM WAS NOT REMOVED");
                                  app.changeLoading();
                                }
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Tổng cộng: ",
                      style: TextStyle(
                          color: grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " ${user.userModel.totalCartPrice.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') }đ",
                      style: TextStyle(
                          color: primary,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: primary),
//                ================================ BUTTON THANH TOÁN =======================================
                child: FlatButton(
                    onPressed: () {
                      if(user.userModel.totalCartPrice == 0){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0)), //this right here
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Your cart is emty', textAlign: TextAlign.center,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20.0)), //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Bạn sẽ thanh toán ${user.userModel.totalCartPrice}đ ', textAlign: TextAlign.center,),

                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () async{
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                                userId: user.user.uid,
                                                id: id,
                                                description: "Đơn hàng của "+user.userModel.name,
                                                status: "complete",
                                                totalPrice: user.userModel.totalCartPrice,
                                                cart: user.userModel.cart
                                            );
                                            for(Map cartItem in user.userModel.cart){
                                              bool value = await user.removeFromCart(cartItem: cartItem);
                                              if(value){
                                                user.reloadUserModel();
                                                print("Item added to cart");
                                                _key.currentState.showSnackBar(
                                                    SnackBar(content: Text("Removed from Cart!")),
                                                );
                                              }else{
                                                print("ITEM WAS NOT REMOVED");
                                              }
                                            }
                                            _key.currentState.showSnackBar(
                                                SnackBar(content: Text("Order created!")),
                                            );
                                            Navigator.pop(context);
                                            await changeScreen(context, PaymentButtonScreen());
                                          },
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            color: red
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text(
                       "Thanh toán",
                      style : TextStyle(fontSize: 20,
                      color: white,
                      fontWeight: FontWeight.normal,)
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
