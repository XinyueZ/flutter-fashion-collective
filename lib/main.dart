import 'package:flutter/material.dart';
import 'package:flutter_fashion_collective/blocs/client_provider.dart';
import 'package:flutter_fashion_collective/config.dart';
import 'package:provider/provider.dart';

import 'blocs/categories_provider.dart';
import 'widgets/categories_list_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClientProvider>.value(
            value: ClientProvider(API_KEY)),
        ChangeNotifierProxyProvider<ClientProvider, CategoriesProvider>(
          create: (context) => CategoriesProvider(),
          update: (context, ClientProvider clientProvider,
              CategoriesProvider categoriesProvider) {
            categoriesProvider.dio = clientProvider.dio;
            categoriesProvider.loadCategories();
            return categoriesProvider;
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Material(
          child: CategoriesListWidget(),
        ),
      ),
    );
  }
}
