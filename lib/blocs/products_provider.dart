import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/config.dart';
import 'package:flutter_fashion_collective/domains/product.dart';
import 'package:flutter_fashion_collective/domains/product_category.dart';
import 'package:flutter_fashion_collective/utils/decoder_helper.dart';
import 'package:sprintf/sprintf.dart';

class ProductsProvider extends ChangeNotifier {
  Dio dio;

  final _productsStreamController = StreamController<List<Product>>();

  Stream<List<Product>> get productsStream => _productsStreamController.stream;

  int count = 0;

  loadProducts({ProductCategory productCategory, String cat}) async {
    final String url =
        sprintf(API_PRODUCT_WITH_CATEGORY, [productCategory?.id ?? cat]);
    final products = await dio?.get(url);
    final Map<String, dynamic> feedsMap =
        DecoderHelper.getJsonDecoder().convert(products.toString());
    final productsMap = feedsMap["products"];
    final List<Product> listOfProduct = productsMap.map<Product>((x) {
      final num id = x["id"];
      final String brandedName = x["brandedName"];
      final String unbrandedName = x["unbrandedName"];
      final String priceLabel = x["priceLabel"];
      final bool inStock = x["inStock"];
      final String description = x["description"];
      final Uri clickUrl = Uri.parse(x["clickUrl"]);
      final Uri thumbnail = Uri.parse(x["image"]["sizes"]["IPhone"]["url"]);
      final String seeMoreLabel = x["seeMoreLabel"];
      final bool isPromotionalDeal = x["promotionalDeal"] != null;

      return Product(id, brandedName, unbrandedName, priceLabel, inStock,
          description, clickUrl, thumbnail, seeMoreLabel, isPromotionalDeal);
    }).toList();

    count = listOfProduct.length;
    _productsStreamController.add(listOfProduct);

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _productsStreamController.close();
  }
}
