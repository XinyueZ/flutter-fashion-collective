import 'package:flutter/material.dart';
import 'package:flutter_fashion_collective/blocs/client_provider.dart';
import 'package:flutter_fashion_collective/blocs/products_provider.dart';
import 'package:flutter_fashion_collective/config.dart';
import 'package:flutter_fashion_collective/widgets/products_list_widget.dart';
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
        ),
        ChangeNotifierProxyProvider<ClientProvider, ProductsProvider>(
          create: (context) => ProductsProvider(),
          update: (context, ClientProvider clientProvider,
              ProductsProvider productsProvider) {
            productsProvider.dio = clientProvider.dio;
            productsProvider.loadProducts(cat: "men");
            return productsProvider;
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        home: Material(
          child: ProductsListWidget(), //CategoriesListWidget(),
        ),
      ),
    );
  }
}
