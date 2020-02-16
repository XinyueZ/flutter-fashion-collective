import 'package:flutter_fashion_collective/feature/contract/entity.dart';
import 'package:flutter_fashion_collective/model/product_category.dart';

class CategoryEntity implements Entity<ProductCategory> {
  const CategoryEntity(this._productCategory)
      : assert(_productCategory is ProductCategory);
  final ProductCategory _productCategory;

  String get id => _productCategory.id;
  String get name => _productCategory.name;
  String get shortName => _productCategory.shortName;

  @override
  ProductCategory get model => _productCategory;
}
