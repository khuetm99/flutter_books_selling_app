import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//===============================HorizontaList=================================
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/a1.png',
            image_caption: 'Children',
          ),
          Category(
            image_location: 'images/a1.png',
            image_caption: 'Literary',
          ),
          Category(
            image_location: 'images/a1.png',
            image_caption: 'Curriculum',
          ),
          Category(
            image_location: 'images/a1.png',
            image_caption: 'Language',
          ),
          Category(
            image_location: 'images/a1.png',
            image_caption: 'Politic-Law',
          ),
          Category(
            image_location: 'images/a1.png',
            image_caption: 'Science-Technology',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
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
        ),
      ),
    );
  }
}

//=====================content=========================
//Most purchased product
class MostPurchasedProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MPProduct(
            mpproduct_location: 'images/a1.png',
            mpproduct_caption: 'Harry Potter(p1)',
          ),
          MPProduct(
            mpproduct_location: 'images/a1.png',
            mpproduct_caption: 'Harry Potter(p6)',
          ),
          MPProduct(
            mpproduct_location: 'images/a1.png',
            mpproduct_caption: 'Harry Potter(p7)',
          ),
          MPProduct(
            mpproduct_location: 'images/a1.png',
            mpproduct_caption: 'One Piece(tap 109)',
          ),
          MPProduct(
            mpproduct_location: 'images/a1.png',
            mpproduct_caption: 'Giao Trinh Tieng Anh',
          ),
          MPProduct(
            mpproduct_location: 'images/a1.png',
            mpproduct_caption: 'Bai Tap Toan(nang cao)',
          ),
        ],
      ),
    );
  }
}

class MPProduct extends StatelessWidget {
  final String mpproduct_location;
  final String mpproduct_caption;

  MPProduct({this.mpproduct_location, this.mpproduct_caption});
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
                mpproduct_location,
                width: 150.0,
                height: 100.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  mpproduct_caption,
                  style: TextStyle(fontSize: 11),
                ),
              )),
        ),
      ),
    );
  }
}

//New book
class NewBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          NBook(
            nbook_location: 'images/a1.png',
            nbook_caption: 'Corduroy',
          ),
          NBook(
            nbook_location: 'images/a1.png',
            nbook_caption: 'Chiec Bao Tay',
          ),
          NBook(
            nbook_location: 'images/a1.png',
            nbook_caption: 'Hoa Sen Tren Tuyet',
          ),
          NBook(
            nbook_location: 'images/a1.png',
            nbook_caption: 'Naruto Phan 2',
          ),
          NBook(
            nbook_location: 'images/a1.png',
            nbook_caption: 'Nguoi Song Sot',
          ),
          NBook(
            nbook_location: 'images/a1.png',
            nbook_caption: 'Ong Gia va Bien Ca(tai ban)',
          ),
        ],
      ),
    );
  }
}

class NBook extends StatelessWidget {
  final String nbook_location;
  final String nbook_caption;

  NBook({this.nbook_location, this.nbook_caption});
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
              nbook_location,
              width: 150.0,
              height: 100.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                nbook_caption,
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
        ),
      ),
    );
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
