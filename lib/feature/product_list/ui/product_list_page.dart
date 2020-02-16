import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/product_list/blocs/product_bloc.dart';
import 'package:flutter_fashion_collective/feature/product_list/entity/product_entity.dart';
import 'package:flutter_fashion_collective/model/product.dart';
import 'package:provider/provider.dart';

import 'item_product_list_widget.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() =>
        Provider.of<ProductBloc>(context, listen: false)
            .loadProductListByCategory(categoryName: "men"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: _buildProductList(context),
    );
  }

  Widget _buildProductList(BuildContext context) {
    final AsyncSnapshot<Result<List<Product>>> loadState =
        Provider.of<ProductBloc>(context).loadListOfProductState;

    switch (loadState.connectionState) {
      case ConnectionState.none:
      case ConnectionState.active:
      case ConnectionState.waiting:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        final Result<List<Product>> result = loadState.data;
        if (result.isError) {
          return ErrorWidget.withDetails(message: "Cannot load product list.");
        }
        final List<Product> listOfProduct = loadState.data.asValue.value;
        return ListView.builder(
            itemCount: listOfProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemProductListWidget(
                  productEntity: ProductEntity(listOfProduct[index]));
            });
    }
    throw Exception("Unknown state ProductBloc.loadListOfProductState");
  }
}
