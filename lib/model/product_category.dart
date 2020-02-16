import 'package:flutter/widgets.dart';
import 'package:sprintf/sprintf.dart';

@immutable
class ProductCategory {
  const ProductCategory(this.id, this.name, this.shortName);

  final String id;
  final String name;
  final String shortName;

  @override
  String toString() {
    final String toString = sprintf(
        "id: %s, name: %s, short-name: %s", <String>[id, name, shortName]);
    return toString;
  }
}
