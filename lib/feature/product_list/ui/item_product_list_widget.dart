import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/product_detail/entity/detail_entity.dart';
import 'package:flutter_fashion_collective/feature/product_detail/ui/product_detail_page.dart';
import 'package:flutter_fashion_collective/feature/product_list/entity/product_entity.dart';
import 'package:flutter_fashion_collective/utils/hero_transition_widget.dart';

class ItemProductListWidget extends StatelessWidget {
  const ItemProductListWidget({Key key, @required ProductEntity productEntity})
      : assert(productEntity is ProductEntity),
        _productEntity = productEntity,
        super(key: key);

  final ProductEntity _productEntity;

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
                tag: _productEntity.thumbnail.toString(),
                photo: _productEntity.thumbnail.toString(),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return ProductDetailPage(
                        detailEntity: DetailEntity(_productEntity.model));
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
                      _productEntity.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _productEntity.subtitle,
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
                            _productEntity.price,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            if (_productEntity.inStock)
                              Image.asset(
                                'assets/icons/ic_in_stock.png',
                                width: 25,
                                height: 25,
                              )
                            else
                              Container(),
                            if (_productEntity.inPromotion)
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
