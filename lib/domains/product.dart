import 'package:sprintf/sprintf.dart';

class Product {
  final num id;
  final String brandedName;
  final String unbrandedName;
  final String priceLabel;
  final bool inStock;
  final String description;
  final Uri clickUrl;
  final Uri thumbnail;
  final Uri photoXLarge;
  final num heightXLarge;
  final String seeMoreLabel;
  final bool isPromotionalDeal;

  Product(
      this.id,
      this.brandedName,
      this.unbrandedName,
      this.priceLabel,
      this.inStock,
      this.description,
      this.clickUrl,
      this.thumbnail,
      this.photoXLarge,
      this.heightXLarge,
      this.seeMoreLabel,
      this.isPromotionalDeal);

  @override
  String toString() {
    String toString = sprintf(
        """id: %s, brandedName: %s, unbrandedName: %s, priceLabel: %s, inStock: %s, description: %s, clickUrl: %s, thumbnail: %s, xlarge: %s, x-large-height: %s, seeMoreLabel: %s, isPromotionalDeal: %s""",
        [
          id.toString(),
          brandedName,
          unbrandedName,
          priceLabel,
          inStock.toString(),
          description,
          clickUrl.toString(),
          thumbnail.toString(),
          photoXLarge.toString(),
          heightXLarge.toString(),
          seeMoreLabel,
          isPromotionalDeal.toString()
        ]);
    return toString;
  }
}
