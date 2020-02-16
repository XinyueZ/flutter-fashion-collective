import 'package:flutter_fashion_collective/data/category_data_source.dart';
import 'package:flutter_fashion_collective/data/product_data_source.dart';
import 'package:flutter_fashion_collective/repository/category_repository.dart';
import 'package:flutter_fashion_collective/repository/product_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> repositoryProvider = <SingleChildWidget>[
  ProxyProvider<CategoryDataSource, CategoryRepository>(
    create: (_) => null,
    update: (_, CategoryDataSource categoryDataSource,
        CategoryRepository previous) {
      if (previous == null && categoryDataSource != null) {
        return CategoryRepositoryImpl(categoryDataSource: categoryDataSource);
      } else {
        return previous;
      }
    },
  ),
  ProxyProvider<ProductDataSource, ProductRepository>(
    create: (_) => null,
    update:
        (_, ProductDataSource productDataSource, ProductRepository previous) {
      if (previous == null && productDataSource != null) {
        return ProductRepositoryImpl(productDataSource: productDataSource);
      } else {
        return previous;
      }
    },
  ),
];
