import 'package:flutter_fashion_collective/app_config/app_config.dart';
import 'package:flutter_fashion_collective/data/category_data_source.dart';
import 'package:flutter_fashion_collective/feature/category/blocs/category_bloc.dart';
import 'package:flutter_fashion_collective/feature/category/use_case/load_category_use_case.dart';
import 'package:flutter_fashion_collective/net/client.dart';
import 'package:flutter_fashion_collective/repository/category_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> categoryListProvider = <SingleChildWidget>[
  ListenableProxyProvider3<AppConfig, Client, CategoryRepository, CategoryBloc>(
    create: (_) => null,
    update: (_, AppConfig appConfig, Client client,
        CategoryRepository categoryRepository, CategoryBloc previous) {
      if (previous == null &&
          appConfig != null &&
          client != null &&
          categoryRepository != null) {
        return CategoryBloc(
            loadCategoryUseCase: LoadCategoryUseCaseImpl(
                categoryRepository: CategoryRepositoryImpl(
                    categoryDataSource: CategoryDataSourceImpl(
                        appConfig: appConfig, client: client))));
      } else {
        return previous;
      }
    },
  ),
];
