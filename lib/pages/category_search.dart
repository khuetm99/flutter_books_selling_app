import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/custom_text.dart';
import 'package:flutterbooksellingapp/components/loading.dart';
import 'package:flutterbooksellingapp/components/single_category.dart';
import 'package:flutterbooksellingapp/helpers/screen_navigation.dart';
import 'package:flutterbooksellingapp/helpers/style.dart';
import 'package:flutterbooksellingapp/pages/category_page.dart';
import 'package:flutterbooksellingapp/provider/app.dart';
import 'package:flutterbooksellingapp/provider/category.dart';
import 'package:flutterbooksellingapp/provider/product.dart';
import 'package:provider/provider.dart';



class CategoriesSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: "Danh mục",
          size: 20,
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: app.isLoading
          ? Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Loading()],
        ),
      )
          : categoryProvider.searchedCategories.length < 1
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                color: grey,
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                text: "No Categories Found",
                color: grey,
                weight: FontWeight.w300,
                size: 22,
              ),
            ],
          )
        ],
      )
          : ListView.builder(
          itemCount: categoryProvider.searchedCategories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () async {
                  app.changeLoading();
                   productProvider.loadProductsByCategory(
                      categoryName: categoryProvider
                          .searchedCategories[index].name);
                  app.changeLoading();

                  await  changeScreen(
                      context,
                      CategoryScreen(
                        categoryModel: categoryProvider
                            .searchedCategories[index],
                      ));
                },
                child: Single_category_list(
                    category_object : categoryProvider
                    .searchedCategories[index]));
          }),
    );
  }
}