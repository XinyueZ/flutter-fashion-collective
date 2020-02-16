import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/product_list/ui/product_list_page.dart';
import 'package:flutter_fashion_collective/injection.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(FashionApp());
}

class FashionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return injection(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        home: Material(
          child: ProductListPage(), //CategoriesListWidget(),
        ),
      ),
    );
  }
}
