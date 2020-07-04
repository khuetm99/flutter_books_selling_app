import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:flutterbooksellingapp/models/category.dart';
import 'package:flutterbooksellingapp/pages/childrenbook.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../pages/product_detail.dart';



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
            height: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Center(
                      child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: category_object.image),
                    )
                  ],
                )),
          ),

          Container(
            width: 140,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.orangeAccent.withOpacity(0.4),
                    Colors.orangeAccent.withOpacity(0.4),
                    Colors.orangeAccent.withOpacity(0.4),
                    Colors.orangeAccent.withOpacity(0.2),
                    Colors.orangeAccent.withOpacity(0.1),
                    Colors.orangeAccent.withOpacity(0.05),
                    Colors.orangeAccent.withOpacity(0.025),
                  ],
                )),
          ),

          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(category_object.name,style : TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500,))))
        ],
      ),
    );
  }
}

