import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/category/blocs/category_bloc.dart';
import 'package:flutter_fashion_collective/feature/category/entity/category_entity.dart';
import 'package:flutter_fashion_collective/model/product_category.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(
        () => Provider.of<CategoryBloc>(context).loadCategoryList());
  }

  @override
  Widget build(BuildContext context) {
    return _buildCategoryList(context);
  }

  Widget _buildCategoryList(BuildContext context) {
    final AsyncSnapshot<Result<List<ProductCategory>>> loadState =
        Provider.of<CategoryBloc>(context).loadListOfCategoryState;

    switch (loadState.connectionState) {
      case ConnectionState.none:
      case ConnectionState.active:
      case ConnectionState.waiting:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        final Result<List<ProductCategory>> result = loadState.data;
        if (result.isError) {
          return ErrorWidget.withDetails(message: "Cannot load category list.");
        }
        final List<ProductCategory> listOfCategory =
            loadState.data.asValue.value;
        return ListView.builder(
            itemCount: listOfCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return ChoiceChip(
                selected: false,
                label: Text(CategoryEntity(listOfCategory[index]).id),
                elevation: 2,
                labelStyle: Theme.of(context).textTheme.subtitle1,
              );
            });
    }
    throw Exception("Unknown state CategoryBloc.loadListOfCategoryState");
  }
}
