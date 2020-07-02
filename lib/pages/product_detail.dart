import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterbooksellingapp/main.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/models/products.dart';
import 'package:flutterbooksellingapp/pages/similar_products.dart';
import '../provider/product.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
final Product bookObject;

 ProductDetails({this.bookObject,});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: InkWell(onTap: () {}, child: Text('BookApp')),
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
      body: ListView(children: <Widget>[
        new Container(
          height: 300.0,
          child: GridTile(
            child: Container(
              color: Colors.white,
              child: Image.asset(widget.bookObject.image),
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
                  widget.bookObject.name,
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
                    '${widget.bookObject.price}',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${widget.bookObject.old_price}',
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
                  widget.bookObject.author,
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
                rating: 4.5,
                size: 20,
                color: Colors.yellow.shade700,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '4.5',
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
          children: <Widget>[
            //==========Size Button=======/
            Expanded(
              child: MaterialButton(
                padding: EdgeInsets.all(10),
                onPressed: () {},
                color: Colors.redAccent,
                textColor: Colors.white,
                elevation: 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Thêm vào giỏ hàng ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Divider(),
//        =================Mô tả sách=================
        new ListTile(
          title: Text(
            'Mô tả sách',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            widget.bookObject.description,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                widget.bookObject.name,
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
                "Name",
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
                widget.bookObject.nxb,
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
                "Name",
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
          ],
        ),
        Container(
          height: 380.0,
//          child: SimilarProducts(),
        )
      ]),
    );
  }
}

