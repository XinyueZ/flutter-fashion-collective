import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/app_config/app_config.dart';
import 'package:flutter_fashion_collective/model/product_category.dart';
import 'package:flutter_fashion_collective/net/client.dart';
import 'package:flutter_fashion_collective/utils/decoder_helper.dart';

abstract class CategoryDataSource {
  Future<List<ProductCategory>> loadCategory();
}

class CategoryDataSourceImpl implements CategoryDataSource {
  CategoryDataSourceImpl(
      {@required Client client, @required AppConfig appConfig})
      : assert(client is Client && appConfig is AppConfig),
        _client = client,
        _appConfig = appConfig;

  final Client _client;
  final AppConfig _appConfig;

  @override
  Future<List<ProductCategory>> loadCategory() async {
    final dynamic category = await _client.get(_appConfig.apiCategory);

    final Map<String, dynamic> feedsMap = DecoderHelper.getJsonDecoder()
        .convert(category.toString()) as Map<String, dynamic>;
    final dynamic categoriesMap = feedsMap["category"];

    final List<ProductCategory> listOfCategory =
        categoriesMap.map<ProductCategory>((dynamic x) {
      return ProductCategory(x["id"].toString(), x["name"].toString(),
          x["ishortNamed"].toString());
    }).toList() as List<ProductCategory>;

    return listOfCategory;
  }
}
