import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/app_config/di.dart';
import 'package:flutter_fashion_collective/data/di.dart';
import 'package:flutter_fashion_collective/feature/category/di.dart';
import 'package:flutter_fashion_collective/feature/product_list/di.dart';
import 'package:flutter_fashion_collective/net/di.dart';
import 'package:flutter_fashion_collective/repository/di.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Widget injection({@required Widget child}) {
  assert(child is Widget);

  return MultiProvider(
    providers: <SingleChildWidget>[
      ...appConfigProvider,
      ...netProvider,
      ...dataSourceProvider,
      ...repositoryProvider,
      ...categoryListProvider,
      ...productListProvider,
    ],
    child: child,
  );
}
