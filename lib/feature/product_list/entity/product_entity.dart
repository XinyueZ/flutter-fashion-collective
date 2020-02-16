import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/feature/contract/entity.dart';
import 'package:flutter_fashion_collective/model/product.dart';

@immutable
class ProductEntity implements Entity<Product> {
  const ProductEntity(this._product) : assert(_product is Product);
  final Product _product;

  Uri get thumbnail => _product.thumbnail;
  String get title => _product.brandedName;
  String get subtitle => _product.seeMoreLabel;
  String get price => _product.priceLabel;
  bool get inStock => _product.inStock;
  bool get inPromotion => _product.isPromotionalDeal;

  @override
  Product get model => _product;
}
