import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/domains/product.dart';

import 'hero_transition_widget.dart';
import 'product_detail_widget.dart';

class ItemProductListWidget extends StatefulWidget {
  const ItemProductListWidget({Key key, this.product}) : super(key: key);

  final Product product;
  @override
  _ItemProductListWidgetState createState() => _ItemProductListWidgetState();
}

class _ItemProductListWidgetState extends State<ItemProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              HeroTransitionWidget(
                width: 74.16,
                height: 120,
                tag: widget.product.thumbnail.toString(),
                photo: widget.product.thumbnail.toString(),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return ProductDetailWidget(product: widget.product);
                  }));
                },
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.product.brandedName,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.product.seeMoreLabel,
                          maxLines: 4,
                          style: Theme.of(context).textTheme.subtitle2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.product.priceLabel,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            if (widget.product.inStock)
                              Image.asset(
                                'assets/icons/ic_in_stock.png',
                                width: 25,
                                height: 25,
                              )
                            else
                              Container(),
                            if (widget.product.isPromotionalDeal)
                              Image.asset(
                                'assets/icons/ic_promotional.png',
                                width: 25,
                                height: 25,
                              )
                            else
                              Container(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
