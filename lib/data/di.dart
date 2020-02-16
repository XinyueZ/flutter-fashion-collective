import 'package:flutter_fashion_collective/app_config/app_config.dart';
import 'package:flutter_fashion_collective/data/category_data_source.dart';
import 'package:flutter_fashion_collective/data/product_data_source.dart';
import 'package:flutter_fashion_collective/net/client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> dataSourceProvider = <SingleChildWidget>[
  ProxyProvider2<AppConfig, Client, CategoryDataSource>(
    create: (_) => null,
    update:
        (_, AppConfig appConfig, Client client, CategoryDataSource previous) {
      if (previous == null && appConfig != null && client != null) {
        return CategoryDataSourceImpl(
          appConfig: appConfig,
          client: client,
        );
      } else {
        return previous;
      }
    },
  ),
  ProxyProvider2<AppConfig, Client, ProductDataSource>(
    create: (_) => null,
    update:
        (_, AppConfig appConfig, Client client, ProductDataSource previous) {
      if (previous == null && appConfig != null && client != null) {
        return ProductDataSourceImpl(
          appConfig: appConfig,
          client: client,
        );
      } else {
        return previous;
      }
    },
  ),
];
