import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/new_book_detail.dart';

class NewBook extends StatefulWidget {
  @override
  _NewBookState createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  var new_book_list = [
    {
      "ten": "One Piece tập 92",
      "picture": "images/products/manga-comic/op92.jpg",
      "tacgia": "Masashi Kishimoto",
      "soluong": 2,
      "gia": 17.550,
      "gia_cu": 19.500,
    },
    {
      "ten": "Doraemon tập 6",
      "picture": "images/products/manga-comic/doraemon6.jpg",
      "tacgia": "Fujiko F Fujio",
      "soluong": 2,
      "gia": 16.200,
      "gia_cu": 18.000,
    },
    {
      "ten": "Đại Việt Sử Ký Toàn Thư",
      "picture": "images/products/lichsu/daivietsukitoanthu.jpg",
      "tacgia": "Nhiều Tác Giả",
      "soluong": 2,
      "gia": 108.900,
      "gia_cu": 198.000,
    },
    {
      "ten": "Kỷ Nguyên Trí Tuệ Nhân Tạo",
      "picture": "images/products/khoahoc-congnhe/kynguyenttnt.jpg",
      "tacgia": "Nhiều Tác Giả",
      "soluong": 2,
      "gia": 70.010,
      "gia_cu": 99.000,
    },
    {
      "ten": "Giáo Dục Công Dân Lớp 9",
      "picture": "images/products/giaokhoa-giaotrinh/congdan9.jpg",
      "tacgia": "Bộ Giáo Dục Và Đào Tạo",
      "soluong": 2,
      "gia": 4.000,
      "gia_cu": 5.400,
    },
    {
      "ten": "28 Ngày Tự Học Tiếng Nhật",
      "picture": "images/products/ngoaingu/28ngaytuhoctiengnhat.jpg",
      "tacgia": "Yu Semi",
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

class NewBook_Single_prod extends StatelessWidget {
  final newbook_ten;
  final newbook_tacgia;
  final newbook_picture;
  final newbook_giacu;
  final newbook_gia;

  NewBook_Single_prod({
    this.newbook_ten,
    this.newbook_tacgia,
    this.newbook_picture,
    this.newbook_giacu,
    this.newbook_gia,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewBookDetail(
                    newbook_detail_ten: newbook_ten,
                    newbook_detail_tacgia: newbook_tacgia,
                    newbook_detail_picture: newbook_picture,
                    newbook_detail_gia: newbook_gia,
                    newbook_detail_gia_cu: newbook_giacu,
                  ))),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 220,
                width: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      newbook_picture,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                newbook_ten,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                newbook_tacgia,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  fontWeight: FontWeight.w300,
                ),
                softWrap: true,
              ),
              SizedBox(
                height: 12,
              ),
              Text('${newbook_gia}\₫',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 12,
              ),
              Text('{$newbook_giacu}\₫',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w300))
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
