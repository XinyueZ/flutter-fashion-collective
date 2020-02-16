import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/feature/product_detail/entity/detail_entity.dart';
import 'package:flutter_fashion_collective/utils/hero_transition_widget.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key key, @required DetailEntity detailEntity})
      : assert(detailEntity is DetailEntity),
        _detailEntity = detailEntity,
        super(key: key);

  final DetailEntity _detailEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ), //左侧按钮
            /**
             * 如果没有leading，automaticallyImplyLeading为true，就会默认返回箭头
             * 如果 没有leading 且为false，空间留给title
             * 如果有leading，这个参数就无效了
             */
            automaticallyImplyLeading: true,
            //title: Text(widget.product.seeMoreLabel), //标题
            centerTitle: false, //标题是否居中
            actions: <Widget>[Icon(Icons.more_vert)], //右侧的内容和点击事件啥的
            elevation: 10, //阴影的高度
            forceElevated: true, //是否显示阴影
            textTheme: const TextTheme(), //字体样式
            primary: true, // appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
            titleSpacing: 0.toDouble(), //标题两边的空白区域
            expandedHeight:
                _detailEntity.maxHeight, //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
            floating: false, //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
            pinned: true, //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
            snap:
                false, //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _detailEntity.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              collapseMode: CollapseMode.pin,
              centerTitle: false,
              background: HeroTransitionWidget(
                tag: _detailEntity.thumbnail.toString(),
                photo: _detailEntity.photoBest.toString(),
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
//          SliverFixedExtentList(
//            itemExtent: 10.0,
//            delegate:
//                SliverChildBuilderDelegate((BuildContext context, int index) {
//              return ListTile(
//                title: Text("List item $index"),
//              );
//            }),
//          )
        ],
      ),
    );
  }
}
