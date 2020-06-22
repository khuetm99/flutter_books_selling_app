import 'package:flutter/material.dart';

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
            image_caption: 'category',),

          Category(
            image_location: 'images/a1.png',
            image_caption: 'category',),

          Category(
            image_location: 'images/a1.png',
            image_caption: 'category',),

          Category(
            image_location: 'images/a1.png',
            image_caption: 'category',),

          Category(
            image_location: 'images/a1.png',
            image_caption: 'category',),

          Category(
            image_location: 'images/a1.png',
            image_caption: 'category',),
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
          width: 80,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 60.0,
              height: 50.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child : Text(image_caption, style: TextStyle(fontSize: 11),),
            ),
          ),
        ),
      ),
    );
  }
}
