import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/blocs/products_provider.dart';
import 'package:flutter_fashion_collective/domains/product.dart';
import 'package:provider/provider.dart';

import 'item_product_list_widget.dart';

class ProductsListWidget extends StatefulWidget {
  @override
  _ProductsListWidgetState createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  ProductsProvider _productsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _productsProvider = Provider.of<ProductsProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: StreamBuilder<List<Product>>(
          stream: _productsProvider.productsStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemProductListWidget(product: snapshot.data[index]);
                  });
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
