import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/blocs/categories_provider.dart';
import 'package:flutter_fashion_collective/domains/product_category.dart';
import 'package:provider/provider.dart';

class ProductsListWidget extends StatefulWidget {
  @override
  _ProductsListWidgetState createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  CategoriesProvider _categoriesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _categoriesProvider = Provider.of<CategoriesProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _categoriesProvider.categoriesStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductCategory>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text("none");
            case ConnectionState.done:
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行三列
                      childAspectRatio: 1.0 //显示区域宽高相等
                      ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data[index].id);
                  });
          }
          return CircularProgressIndicator();
        });
  }
}
