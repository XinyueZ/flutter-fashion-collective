import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/blocs/categories_provider.dart';
import 'package:flutter_fashion_collective/domains/product_category.dart';
import 'package:provider/provider.dart';

class CategoriesListWidget extends StatefulWidget {
  @override
  _CategoriesListWidgetState createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  CategoriesProvider _categoriesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _categoriesProvider = Provider.of<CategoriesProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductCategory>>(
        stream: _categoriesProvider.categoriesStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductCategory>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 150),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChoiceChip(
                    selected: false,
                    label: Text(snapshot.data[index].id),
                    elevation: 2,
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  );
                });
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
