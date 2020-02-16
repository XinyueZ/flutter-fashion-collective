import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/contract/entity.dart';
import 'package:flutter_fashion_collective/model/product.dart';

@immutable
class DetailEntity implements Entity<Product> {
  const DetailEntity(this._product) : assert(_product is Product);
  final Product _product;

  double get maxHeight => _product.heightXLarge.toDouble();
  String get title => _product.seeMoreLabel;
  Uri get thumbnail => _product.thumbnail;
  Uri get photoBest => _product.photoXLarge;

  @override
  Product get model => _product;
}
