import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/domains/product.dart';

class ItemProductListWidget extends StatefulWidget {
  final Product product;

  const ItemProductListWidget({Key key, this.product}) : super(key: key);

  @override
  _ItemProductListWidgetState createState() => _ItemProductListWidgetState();
}

class _ItemProductListWidgetState extends State<ItemProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Image(
              width: 74.16,
              height: 120,
              image: NetworkImage(widget.product.thumbnail.toString()),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.product.brandedName,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.seeMoreLabel,
                        maxLines: 4,
                        style: Theme.of(context).textTheme.subtitle,
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
                          style: Theme.of(context).textTheme.display1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: widget.product.inStock
                              ? Image.asset(
                                  'assets/icons/ic_in_stock.png',
                                  width: 25,
                                  height: 25,
                                )
                              : Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
