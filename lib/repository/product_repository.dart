import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/data/product_data_source.dart';
import 'package:flutter_fashion_collective/model/product.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> loadProductByCategoryName(
      {@required String categoryName});
}

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({@required ProductDataSource productDataSource})
      : assert(productDataSource is ProductDataSource),
        _productDataSource = productDataSource;
  final ProductDataSource _productDataSource;

  @override
  Future<Result<List<Product>>> loadProductByCategoryName(
      {@required String categoryName}) async {
    assert(categoryName is String);
    try {
      return ValueResult<List<Product>>(await _productDataSource
          .loadProductByCategoryName(categoryName: categoryName));
    } catch (e, s) {
      return ErrorResult(e, s);
    }
  }
}
