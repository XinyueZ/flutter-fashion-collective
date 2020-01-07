import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroTransitionWidget extends StatelessWidget {
  const HeroTransitionWidget(
      {Key key, this.photo, this.onTap, this.width, this.height, this.tag})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double height;
  final String tag;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image(
              image: NetworkImage(photo),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
