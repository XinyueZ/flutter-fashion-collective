import 'package:flutter_fashion_collective/app_config/app_config.dart';
import 'package:flutter_fashion_collective/data/product_data_source.dart';
import 'package:flutter_fashion_collective/feature/product_list/blocs/product_bloc.dart';
import 'package:flutter_fashion_collective/feature/product_list/use_case/load_product_by_category_name_use_case.dart';
import 'package:flutter_fashion_collective/net/client.dart';
import 'package:flutter_fashion_collective/repository/product_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> productListProvider = <SingleChildWidget>[
  ListenableProxyProvider3<AppConfig, Client, ProductRepository, ProductBloc>(
    create: (_) => null,
    update: (_, AppConfig appConfig, Client client,
        ProductRepository productRepository, ProductBloc previous) {
      if (previous == null &&
          appConfig != null &&
          client != null &&
          productRepository != null) {
        return ProductBloc(
            loadProductByCategoryNameUseCase:
                LoadProductByCategoryNameUseCaseImpl(
                    productRepository: ProductRepositoryImpl(
                        productDataSource: ProductDataSourceImpl(
                            appConfig: appConfig, client: client))));
      } else {
        return previous;
      }
    },
  ),
];
