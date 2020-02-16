import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/model/product.dart';
import 'package:flutter_fashion_collective/repository/product_repository.dart';

abstract class LoadProductByCategoryNameUseCase {
  Future<Result<List<Product>>> call({@required String categoryName});
}

class LoadProductByCategoryNameUseCaseImpl
    implements LoadProductByCategoryNameUseCase {
  LoadProductByCategoryNameUseCaseImpl(
      {@required ProductRepository productRepository})
      : assert(productRepository is ProductRepository),
        _productRepository = productRepository;

  final ProductRepository _productRepository;

  @override
  Future<Result<List<Product>>> call({@required String categoryName}) {
    return _productRepository.loadProductByCategoryName(
        categoryName: categoryName);
  }
}
