import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/model/product_category.dart';
import 'package:flutter_fashion_collective/repository/category_repository.dart';

abstract class LoadCategoryUseCase {
  Future<Result<List<ProductCategory>>> call();
}

class LoadCategoryUseCaseImpl implements LoadCategoryUseCase {
  LoadCategoryUseCaseImpl({@required CategoryRepository categoryRepository})
      : assert(categoryRepository is CategoryRepository),
        _categoryRepository = categoryRepository;

  final CategoryRepository _categoryRepository;

  @override
  Future<Result<List<ProductCategory>>> call() {
    return _categoryRepository.loadCategory();
  }
}
