import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/custom_text.dart';
import 'package:flutterbooksellingapp/components/order_detail.dart';
import 'package:flutterbooksellingapp/helpers//style.dart';
import 'package:flutterbooksellingapp/models/order.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
      ),
      backgroundColor: white,
      body: ListView.builder(
          itemCount: user.orders.length,
          itemBuilder: (_, index){
            OrderModel _order = user.orders[index];
            return GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => OderDetailPage(order: _order,)));},
              child: ListTile(
                leading: CustomText(
                  text: "${_order.total.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}đ",
                  weight: FontWeight.bold,
                ),
                title: Text(_order.description),
                subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.createdAt).toString()),
                trailing: CustomText(text: _order.status, color: green,),
              ),
            );
          }),
    );
  }
}
