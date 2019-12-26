import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/config.dart';
import 'package:flutter_fashion_collective/domains/product_category.dart';
import 'package:flutter_fashion_collective/utils/decoder_helper.dart';
import 'package:sprintf/sprintf.dart';

class CategoriesProvider extends ChangeNotifier {
  Dio dio;

  final _categoriesStreamController = StreamController<List<ProductCategory>>.broadcast();

  Stream<List<ProductCategory>> get categoriesStream =>
      _categoriesStreamController.stream;

  int count = 0;

  loadCategories() async {
    final categories = await dio?.get(API_CATEGORIES);
    final Map<String, dynamic> feedsMap =
        DecoderHelper.getJsonDecoder().convert(categories.toString());
    final categoriesMap = feedsMap["categories"];
    final List<ProductCategory> listOfCategory =
        categoriesMap.map<ProductCategory>((x) {
      return ProductCategory(x["id"], x["name"], x["ishortNamed"]);
    }).toList();

    count = listOfCategory.length;
    _categoriesStreamController.add(listOfCategory);

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _categoriesStreamController.close();
  }
}
