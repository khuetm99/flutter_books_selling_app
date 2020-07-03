import 'package:flutter/material.dart';
import '../helpers/category.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier{
  CategoryServices _categoryServices = CategoryServices();
  List<Category> categories = [];
  List<Category> searchedCategories = [];

  CategoryProvider.initialize(){
    loadCategories();
  }

  loadCategories()async{
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }

  Future search({String name})async{
    searchedCategories = await _categoryServices.searchCategory(categoryName: name);
    print("CATE ARE: ${searchedCategories.length}");
    notifyListeners();
  }
}