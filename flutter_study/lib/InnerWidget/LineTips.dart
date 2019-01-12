
import 'package:flutter/material.dart';

/// 左右对称线 中部文字
class LineTips extends StatelessWidget {

  static const defaultMargin = const EdgeInsets.only(left: 15.0, right: 15.0);
  final Widget title;
  final EdgeInsetsGeometry margin;

  LineTips({
    @required this.title,
    this.margin = defaultMargin,
  });
  @override
  Widget build(BuildContext context) {

    return new Padding(
      padding: defaultMargin,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(
                right: 10.0,
              ),
              color: const Color(0xFFD4CFE4),
              height: 1.0,
            ),
          ),
          title,
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(
                left: 10.0,
              ),
              color: const Color(0xFFD4CFE4),
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}



