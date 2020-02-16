import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/data/category_data_source.dart';
import 'package:flutter_fashion_collective/model/product_category.dart';

abstract class CategoryRepository {
  Future<Result<List<ProductCategory>>> loadCategory();
}

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({@required CategoryDataSource categoryDataSource})
      : assert(categoryDataSource is CategoryDataSource),
        _categoryDataSource = categoryDataSource;
  final CategoryDataSource _categoryDataSource;

  @override
  Future<Result<List<ProductCategory>>> loadCategory() async {
    try {
      return ValueResult<List<ProductCategory>>(
          await _categoryDataSource.loadCategory());
    } catch (e, s) {
      return ErrorResult(e, s);
    }
  }
}
