import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/app_config/app_config.dart';
import 'package:flutter_fashion_collective/model/product.dart';
import 'package:flutter_fashion_collective/net/client.dart';
import 'package:flutter_fashion_collective/utils/decoder_helper.dart';
import 'package:sprintf/sprintf.dart';

abstract class ProductDataSource {
  Future<List<Product>> loadProductByCategoryName(
      {@required String categoryName});
}

class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl(
      {@required Client client, @required AppConfig appConfig})
      : assert(client is Client && appConfig is AppConfig),
        _client = client,
        _appConfig = appConfig;

  final Client _client;
  final AppConfig _appConfig;

  @override
  Future<List<Product>> loadProductByCategoryName({String categoryName}) async {
    assert(categoryName is String);

    final String url =
        sprintf(_appConfig.apiProductByCategory, <String>[categoryName]);

    final dynamic product = await _client.get(url);
    final Map<String, dynamic> feedsMap = DecoderHelper.getJsonDecoder()
        .convert(product.toString()) as Map<String, dynamic>;
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

    return listOfProduct;
  }
}
