import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_ten;
  final product_detail_tacgia;
  final product_detail_gia;
  final product_detail_gia_cu;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_ten,
    this.product_detail_tacgia,
    this.product_detail_picture,
    this.product_detail_gia,
    this.product_detail_gia_cu,
  });

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
      body: ListView(children: <Widget>[
        new Container(
          height: 300.0,
          child: GridTile(
            child: Container(
              color: Colors.white,
              child: Image.asset(widget.product_detail_picture),
            ),
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: new Text(
                  widget.product_detail_ten,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${widget.product_detail_gia_cu}',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      '${widget.product_detail_gia}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
//       ============ Tên sách, giá sách============
        Column(
          children: <Widget>[
            Container(
              child: ListTile(
                leading: new Text(
                  widget.product_detail_ten,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${widget.product_detail_gia_cu}',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      '${widget.product_detail_gia}VND',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ],
                ),
              ),
            ),

//            =========Tác giả=========
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                ),
                Text(
                  widget.product_detail_tacgia,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
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
                  onPressed: () {},
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text(
                    'Thêm vào giỏ hàng ',
                    style: TextStyle(color: Colors.white),
                  )),
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
            ''' \n    Thế giới ngầm được phản ánh trong tiểu thuyết Bố Già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố Già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí. Nhân vật trung tâm ấy đồng thời cũng là hiện thân của một pho triết lí rất “đời” được nhào nặn từ vốn sống của hàng chục năm lăn lộn giữa chốn giang hồ bao phen vào sinh ra tử, vì thế mà có ý kiến cho rằng “Bố Già là sự tổng hòa của mọi hiểu biết. Bố Già là đáp án cho mọi câu hỏi.
   
   Với cấu tứ hoàn hảo, cốt truyện không thiếu những pha hành động gay cấn, tình tiết bất ngờ và không khí kình địch đến nghẹt thở, Bố Già xứng đáng là đỉnh cao trong sự nghiệp văn chương của Mario Puzo. Và như một cơ duyên đặc biệt, ngay từ năm 1971-1972, Bố Già đã đến với bạn đọc trong nước qua phong cách chuyển ngữ hào sảng, đậm chất giang hồ của dịch giả Ngọc Thứ Lang.''',
            textAlign: TextAlign.justify,
          ),
        ),
        Divider(),
//        ================= Thông tin sách ==================
        Row(
          children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                  child : Text(' Thông tin sách ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
          ],
        ),

        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child : Text('  Tên sách ', style: TextStyle(fontSize: 15, color: Colors.grey),)),
            Padding(padding: EdgeInsets.all(5.0),
              child: Text(widget.product_detail_ten,style: TextStyle(fontSize: 14),),
            )],
        ),

        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child : Text('  Loại sách ', style: TextStyle(fontSize: 15, color: Colors.grey),)),
            Padding(padding: EdgeInsets.all(5),
              child: Text("Name",style: TextStyle(fontSize: 14),),)
          ],
        ),

        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child : Text('  Nhà xuất bản ', style: TextStyle(fontSize: 15, color: Colors.grey),)),
            Padding(padding: EdgeInsets.all(5),
              child: Text("Name",style: TextStyle(fontSize: 14),),)
          ],
        ),

        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child : Text('  Trạng thái', style: TextStyle(fontSize: 15, color: Colors.grey),)),
            Padding(padding: EdgeInsets.all(5),
              child: Text("Name",style: TextStyle(fontSize: 14),),)
          ],
        ),
      ]),
    );
  }
}
