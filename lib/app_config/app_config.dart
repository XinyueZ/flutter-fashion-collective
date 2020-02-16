import 'package:flutter/foundation.dart';

abstract class AppConfig {
  String get apiKey;
  String get host;
  String get apiProduct;
  String get apiProductById;
  String get apiProductByCategory;
  String get apiCategory;
}

@immutable
class AppConfigImpl implements AppConfig {
  static const String HOST = "https://api.shopstyle.com/api/v2";
  static const String API_PRODUCT = "/products?fts=%s";
  static const String API_PRODUCT_WITH_ID = "/products/%s";
  static const String API_PRODUCT_WITH_CATEGORY =
      "/products?limit=20&offset=0&cat=%s";
  static const String API_CATEGORIES = "/categories";
  static const String API_KEY = "uid4100-40207790-50";

  @override
  String get apiCategory => API_CATEGORIES;

  @override
  String get apiKey => API_KEY;

  @override
  String get apiProduct => API_PRODUCT;

  @override
  String get apiProductByCategory => API_PRODUCT_WITH_CATEGORY;

  @override
  String get apiProductById => API_PRODUCT_WITH_ID;

  @override
  String get host => HOST;
}
