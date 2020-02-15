import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/config.dart';
import 'package:flutter_fashion_collective/domains/product_category.dart';
import 'package:flutter_fashion_collective/utils/decoder_helper.dart';

class CategoriesProvider extends ChangeNotifier {
  Dio dio;

  final StreamController<List<ProductCategory>> _categoriesStreamController =
      StreamController<List<ProductCategory>>.broadcast();

  Stream<List<ProductCategory>> get categoriesStream =>
      _categoriesStreamController.stream;

  int count = 0;

  Future<void> loadCategories() async {
    final Response<dynamic> categories =
        await dio?.get<dynamic>(API_CATEGORIES);
    final Map<String, dynamic> feedsMap = DecoderHelper.getJsonDecoder()
        .convert(categories.toString()) as Map<String, dynamic>;
    final dynamic categoriesMap = feedsMap["categories"];
    final List<ProductCategory> listOfCategory =
        categoriesMap.map<ProductCategory>((dynamic x) {
      return ProductCategory(x["id"].toString(), x["name"].toString(),
          x["ishortNamed"].toString());
    }).toList() as List<ProductCategory>;

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
