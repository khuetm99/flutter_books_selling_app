import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterbooksellingapp/components/custom_text.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:flutterbooksellingapp/helpers/screen_navigation.dart';
import 'package:flutterbooksellingapp/helpers/style.dart';
import 'package:flutterbooksellingapp/main.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/cart_page.dart';
import 'package:flutterbooksellingapp/pages/popular_books.dart';
import 'package:flutterbooksellingapp/pages/similar_products.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/user.dart';
import '../provider/product.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({
    this.product,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              changeScreen(context, CartScreen());
            },
          ),

        ],
        leading: IconButton(icon: Icon(Icons.close), onPressed: (){Navigator.pop(context);}),
      ),
      body: SafeArea(
         child: app.isLoading ? Loading() :  ListView(children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product.image),
              ),
              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading: new Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
//       ============ Tên sách============
          Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: new Text(
                    widget.product.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    softWrap: true,
                  ),
                ),
              ),
//            ===============Giá sách, giá cũ c==========
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Expanded(
                    child: Text(
                      '${widget.product.price}đ',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${widget.product.old_price}đ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
//            =========Tác giả=========
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Text(
                    widget.product.author,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
//            ========Rating==========
              SizedBox(
                height: 7,
              ),
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(7),
                ),
                StarRating(
                  rating: double.parse(widget.product.rating),
                  size: 20,
                  color: Colors.yellow.shade700,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.product.rating,
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                )
              ]),
            ],
          ),

          SizedBox(
            height: 5,
          ),
          // ============= Button thêm vào giỏ =============/

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 36,
                    ),
                    onPressed: () {
                      if (quantity != 1) {
                        setState(() {
                          quantity -= 1;
                        });
                      }
                    }),
              ),
              GestureDetector(
                onTap: () async {
                  app.changeLoading();
                  print("All set loading");

                  bool value = await user.addToCard(
                      product: widget.product, quantity: quantity);
                  if (value) {
                    print("Item added to cart");
                    _key.currentState
                        .showSnackBar(SnackBar(content: Text("Added ro Cart!")));
                    user.reloadUserModel();
                    app.changeLoading();
                    return;
                  } else {
                    print("Item NOT added to cart");
                  }
                  print("lOADING SET TO FALSE");
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(20)),
                  child: app.isLoading
                      ? Loading()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                          child: CustomText(
                            text: "Thêm $quantity Vào Giỏ",
                            color: white,
                            size: 22,
                            weight: FontWeight.w300,
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 36,
                      color: red,
                    ),
                    onPressed: () {
                      setState(() {
                        quantity += 1;
                      });
                    }),
              ),
            ],
          ),

          Divider(),
//        =================Mô tả sách=================
          new ListTile(
            title: Text(
              'Mô tả sách',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              widget.product.description,
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(),
//        ================= Thông tin sách ==================
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                  child: Text(
                    ' Thông tin sách ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                  child: Text(
                    '  Tên sách ',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                  child: Text(
                    '  Loại sách ',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  widget.product.category,
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                  child: Text(
                    '  Nhà xuất bản ',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  widget.product.nxb,
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                  child: Text(
                    '  Trạng thái',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Còn hàng",
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
          Divider(),
//        ===========Sản phẩm gợi ý ===========
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                  child: Text(
                    ' Gợi ý sách ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
            ],
          ),
          Container(
            height: 380.0,
           child: Popular_products(),
          )
        ]),
      ),
    );
  }
}
