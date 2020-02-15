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

  final StreamController<List<Product>> _productsStreamController =
      StreamController<List<Product>>();

  Stream<List<Product>> get productsStream => _productsStreamController.stream;

  int count = 0;

  Future<void> loadProducts(
      {ProductCategory productCategory, String cat}) async {
    final String url = sprintf(
        API_PRODUCT_WITH_CATEGORY, <String>[productCategory?.id ?? cat]);
    final dynamic products = await dio?.get<dynamic>(url);
    final Map<String, dynamic> feedsMap = DecoderHelper.getJsonDecoder()
        .convert(products.toString()) as Map<String, dynamic>;
    final dynamic productsMap = feedsMap["products"];
    final List<Product> listOfProduct = productsMap.map<Product>((dynamic x) {
      final num id = x["id"] as num;
      final String brandedName = x["brandedName"].toString();
      final String unbrandedName = x["unbrandedName"].toString();
      final String priceLabel = x["priceLabel"].toString();
      final bool inStock = x["inStock"] as bool;
      final String description = x["description"].toString();
      final Uri clickUrl = Uri.parse(x["clickUrl"].toString());
      final Uri thumbnail =
          Uri.parse(x["image"]["sizes"]["IPhone"]["url"].toString());
      final Uri photoXLarge =
          Uri.parse(x["image"]["sizes"]["XLarge"]["url"].toString());
      final num photoXLargeHeight =
          x["image"]["sizes"]["XLarge"]["height"] as num;
      final String seeMoreLabel = x["seeMoreLabel"].toString();
      final bool isPromotionalDeal = x["promotionalDeal"] != null;

      return Product(
          id,
          brandedName,
          unbrandedName,
          priceLabel,
          inStock,
          description,
          clickUrl,
          thumbnail,
          photoXLarge,
          photoXLargeHeight,
          seeMoreLabel,
          isPromotionalDeal);
    }).toList() as List<Product>;

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
