import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
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
        itemCount: product_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            product_ten: product_list[index]['ten'],
            product_tacgia: product_list[index]['tacgia'],
            product_picture: product_list[index]['picture'],
            product_giacu: product_list[index]['gia_cu'],
            product_gia: product_list[index]['gia'],
          );
        },
      ),
    );
  }
}

class Single_prod extends StatelessWidget {
  final product_ten;
  final product_tacgia;
  final product_picture;
  final product_giacu;
  final product_gia;

  Single_prod({
    this.product_ten,
    this.product_tacgia,
    this.product_picture,
    this.product_giacu,
    this.product_gia,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(
                    product_detail_ten: product_ten,
                    product_detail_tacgia: product_tacgia,
                    product_detail_picture: product_picture,
                    product_detail_gia: product_gia,
                    product_detail_gia_cu: product_giacu,
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
                      product_picture,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                product_ten,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                product_tacgia,
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
              Text('${product_gia}\₫',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 12,
              ),
              Text('{$product_giacu}\₫',
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
