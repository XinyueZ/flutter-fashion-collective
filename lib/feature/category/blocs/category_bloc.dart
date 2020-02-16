import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/category/use_case/load_category_use_case.dart';
import 'package:flutter_fashion_collective/model/product_category.dart';

class CategoryBloc extends ChangeNotifier {
  CategoryBloc({@required LoadCategoryUseCase loadCategoryUseCase})
      : assert(loadCategoryUseCase is LoadCategoryUseCase),
        _loadCategoryUseCase = loadCategoryUseCase;

  AsyncSnapshot<Result<List<ProductCategory>>> loadListOfCategoryState =
      const AsyncSnapshot<Result<List<ProductCategory>>>.nothing();

  final LoadCategoryUseCase _loadCategoryUseCase;

  Future<void> loadCategoryList() async {
    loadListOfCategoryState =
        const AsyncSnapshot<Result<List<ProductCategory>>>.withData(
            ConnectionState.waiting, null);
    notifyListeners();

    final Result<List<ProductCategory>> result =
        await _loadCategoryUseCase.call();

    loadListOfCategoryState =
        AsyncSnapshot<Result<List<ProductCategory>>>.withData(
            ConnectionState.done, result);

    notifyListeners();
  }
}
