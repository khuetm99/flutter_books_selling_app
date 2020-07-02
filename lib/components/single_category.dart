import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
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
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      padding: EdgeInsets.all(13),
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryProvider.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Single_category_list(
                category_object: categoryProvider.categories[index]);
          }),
    );
  }
}

class Single_category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final Category category_object;

  Single_category(
      {this.image_location, this.image_caption, this.category_object});

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

class Single_category_list extends StatelessWidget {
  final Category category_object;

  Single_category_list({this.category_object});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Stack(
        children: <Widget>[
          Container(
            width: 140,
            height: 160,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Center(
                      child: Image.asset( category_object.image, fit: BoxFit.cover,),
                    )
                  ],
                )),
          ),

          Container(
            width: 140,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.025),
                  ],
                )),
          ),

          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(category_object.name,style : TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w300,))))
        ],
      ),
    );
  }
}

