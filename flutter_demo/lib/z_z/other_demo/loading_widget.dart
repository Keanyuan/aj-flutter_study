import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  /// ProgressIndicator的padding，决定loading的大小
  final EdgeInsets padding = EdgeInsets.all(30.0);

  /// 文字顶部距菊花的底部的距离
  final double margin = 10.0;

  /// 圆角
  final double cornerRadius = 10.0;

  final Widget _child;
  final bool _isLoading;
  final double opacity;
  final Color color;
  final String text;

  Loading({
    Key key,
    @required child,
    @required isLoading,
    this.text,
    this.opacity = 0.3,
    this.color = Colors.grey,
  })  : assert(child != null),
        assert(isLoading != null),
        _child = child,
        _isLoading = isLoading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List<Widget>();
    widgetList.add(_child);
    if (_isLoading) {
      final loading = [
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: false, color: color),
        ),
        _buildProgressIndicator()
      ];
      widgetList.addAll(loading);
    }
    return Stack(
      children: widgetList,
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Container(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(),
            Padding(
                padding: EdgeInsets.only(top: margin),
                child: Text(text ?? '加载中...')),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            color: Colors.white),
      ),
    );
  }
}
