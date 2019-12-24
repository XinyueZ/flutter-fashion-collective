import 'package:sprintf/sprintf.dart';

class ProductCategory {
  final String id;
  final String name;
  final String shortName;

  ProductCategory(this.id, this.name, this.shortName);

  @override
  String toString() {
    final String toString = sprintf("id: %s, name: %s, short-name: %s", [id, name, shortName]);
    return toString;
  }
}
