import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterbooksellingapp/main.dart';
import 'package:flutterbooksellingapp/components/new_book.dart';

class NewBookDetail extends StatefulWidget {
  final newbook_detail_ten;
  final newbook_detail_tacgia;
  final newbook_detail_gia;
  final newbook_detail_gia_cu;
  final newbook_detail_picture;

  NewBookDetail({
    this.newbook_detail_ten,
    this.newbook_detail_tacgia,
    this.newbook_detail_picture,
    this.newbook_detail_gia,
    this.newbook_detail_gia_cu,
  });

  @override
  _NewBookDetailState createState() => _NewBookDetailState();
}

class _NewBookDetailState extends State<NewBookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => new HomePage())),
            child: Text('BookApp')),
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
              child: Image.asset(widget.newbook_detail_picture),
            ),
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: new Text(
                  widget.newbook_detail_ten,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${widget.newbook_detail_gia_cu}\₫',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      '${widget.newbook_detail_gia}\₫',
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
                  widget.newbook_detail_ten,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${widget.newbook_detail_gia_cu}\₫',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      '${widget.newbook_detail_gia}\₫',
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
                  widget.newbook_detail_tacgia,
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
            ''' \n    Thế giới ngầm được phản ánh trong tiểu thuyết Bố Già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố Già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí. Nhân vật trung tâm ấy đồng thời cũng là hiện thân của một pho triết lí rất “đời” được nhào nặn từ vốn sống của hàng chục năm lăn lộn giữa chốn giang hồ bao phen vào sinh ra tử, vì thế mà có ý kiến cho rằng “Bố Già là sự tổng hòa của mọi hiểu biết. Bố Già là đáp án cho mọi câu hỏi.
   
   Với cấu tứ hoàn hảo, cốt truyện không thiếu những pha hành động gay cấn, tình tiết bất ngờ và không khí kình địch đến nghẹt thở, Bố Già xứng đáng là đỉnh cao trong sự nghiệp văn chương của Mario Puzo. Và như một cơ duyên đặc biệt, ngay từ năm 1971-1972, Bố Già đã đến với bạn đọc trong nước qua phong cách chuyển ngữ hào sảng, đậm chất giang hồ của dịch giả Ngọc Thứ Lang.''',
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
                widget.newbook_detail_ten,
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
          child: SimilarProducts(),
        )
      ]),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var new_book_list = [
    {
      "ten": "One Piece tập 92",
      "picture": "images/c1.jpg",
      "soluong": 2,
      "gia": 17.550,
      "gia_cu": 19.500,
    },
    {
      "ten": "Doraemon tập 6",
      "picture": "images/c1.jpg",
      "soluong": 2,
      "gia": 16.200,
      "gia_cu": 18.000,
    },
    {
      "ten": "Đại Việt Sử Ký Toàn Thư",
      "picture": "images/c1.jpg",
      "soluong": 2,
      "gia": 108.900,
      "gia_cu": 198.000,
    },
    {
      "ten": "Kỷ Nguyên Trí Tuệ Nhân Tạo",
      "picture": "images/c1.jpg",
      "soluong": 2,
      "gia": 70.010,
      "gia_cu": 99.000,
    },
    {
      "ten": "Giáo Dục Công Dân Lớp 9",
      "picture": "images/c1.jpg",
      "soluong": 2,
      "gia": 4.000,
      "gia_cu": 5.400,
    },
    {
      "ten": "28 Ngày Tự Học Tiếng Nhật",
      "picture": "images/c1.jpg",
      "soluong": 2,
      "gia": 162.289,
      "gia_cu": 46.512,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: new_book_list.length,
        itemBuilder: (BuildContext context, int index) {
          return NewBook_Single_prod(
            newbook_ten: new_book_list[index]['ten'],
            newbook_tacgia: new_book_list[index]['tacgia'],
            newbook_picture: new_book_list[index]['picture'],
            newbook_giacu: new_book_list[index]['gia_cu'],
            newbook_gia: new_book_list[index]['gia'],
          );
        },
      ),
    );
  }
}
