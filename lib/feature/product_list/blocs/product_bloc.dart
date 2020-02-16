import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/product_list/use_case/load_product_by_category_name_use_case.dart';
import 'package:flutter_fashion_collective/model/product.dart';

class ProductBloc extends ChangeNotifier {
  ProductBloc(
      {@required
          LoadProductByCategoryNameUseCase loadProductByCategoryNameUseCase})
      : assert(loadProductByCategoryNameUseCase
            is LoadProductByCategoryNameUseCase),
        _loadProductByCategoryNameUseCase = loadProductByCategoryNameUseCase;

  AsyncSnapshot<Result<List<Product>>> loadListOfProductState =
      const AsyncSnapshot<Result<List<Product>>>.nothing();

  final LoadProductByCategoryNameUseCase _loadProductByCategoryNameUseCase;

  Future<void> loadProductListByCategory(
      {@required String categoryName}) async {
    assert(categoryName is String);

    loadListOfProductState =
        const AsyncSnapshot<Result<List<Product>>>.withData(
            ConnectionState.waiting, null);
    notifyListeners();

    final Result<List<Product>> result = await _loadProductByCategoryNameUseCase
        .call(categoryName: categoryName);

    loadListOfProductState = AsyncSnapshot<Result<List<Product>>>.withData(
        ConnectionState.done, result);

    notifyListeners();
  }
}
