import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/models/category.dart';
import 'package:flutterbooksellingapp/pages/childrenbook.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'package:provider/provider.dart';
import '../pages/product_detail.dart';

//===============================HorizontaList=================================
class HorizontalList extends StatelessWidget {
  final Single_category category;

  HorizontalList({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconthieunhi.jpg',
              image_caption: 'Thiếu Nhi',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconkinhte.jpg',
              image_caption: 'Kinh Tế',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconkynangsong.jpg',
              image_caption: 'Kỹ Năng Sống',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconngoaingu.jpg',
              image_caption: 'Ngoại Ngữ',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconchinhtriphapluat.jpg',
              image_caption: 'Chính Trị-Pháp Luật',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconkhoahoccongnghe.jpg',
              image_caption: 'Khoa Học-Công Nghệ',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconlichsu.jpg',
              image_caption: 'Lịch Sử',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconmangacomic.png',
              image_caption: 'Manga-Comic',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconthamkhao.jpg',
              image_caption: 'Tham Khảo',
            ),
          ),
          InkWell(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ChildrenBook())),
            child: Single_category(
              image_location: 'images/icon/iconsgkgt.png',
              image_caption: 'Giáo Khoa-Giáo Trình',
            ),
          ),
        ],
      ),
    );
  }
}

class Category_List extends StatefulWidget {
  @override
  _Category_ListState createState() => _Category_ListState();
}

class _Category_ListState extends State<Category_List> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider  =  Provider.of<CategoryProvider>(context);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryProvider.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Single_category(
            image_caption: categoryProvider.categories[index].name,
            image_location: categoryProvider.categories[index].image,
            category_object: categoryProvider.categories[index]
          );
        });
  }
}


class Single_category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final Category category_object;

  Single_category({this.image_location, this.image_caption, this.category_object});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 80.0,
              height: 50.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
        ));
  }
}


//Flash Sale
class FlashSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          FSale(
            fsale_location: 'images/a1.png',
            fsale_caption: 'Toan 7(tap 1) - 20%',
          ),
          FSale(
            fsale_location: 'images/a1.png',
            fsale_caption: 'Ngu Van 9(tap 2) - 17%',
          ),
          FSale(
            fsale_location: 'images/a1.png',
            fsale_caption: 'Giao Trinh Tieng Anh - 10%',
          ),
          FSale(
            fsale_location: 'images/a1.png',
            fsale_caption: 'Nha Gia Kim - 15%',
          ),
          FSale(
            fsale_location: 'images/a1.png',
            fsale_caption: 'Gone Girl - 5%',
          ),
          FSale(
            fsale_location: 'images/a1.png',
            fsale_caption: 'Nuoi Con - 19%',
          ),
        ],
      ),
    );
  }
}

class FSale extends StatelessWidget {
  final String fsale_location;
  final String fsale_caption;

  FSale({this.fsale_location, this.fsale_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              fsale_location,
              width: 150.0,
              height: 100.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                fsale_caption,
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
