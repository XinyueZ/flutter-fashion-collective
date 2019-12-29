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
              width: 114.59,
              height: 185.41,
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
                    child: Text(
                      widget.product.description,
                      maxLines: 4,
                      style: Theme.of(context).textTheme.subtitle,
                      overflow: TextOverflow.ellipsis,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: widget.product.inStock
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.red,
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
