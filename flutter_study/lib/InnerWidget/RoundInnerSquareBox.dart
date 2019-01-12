import 'package:flutter/material.dart';

/// 自定义边框Container
class RoundInnerSquareBox extends StatelessWidget {
  static const double gap = 12.0;

  RoundInnerSquareBox({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new ClipRRect(
      borderRadius: const BorderRadius.all(const Radius.circular(16.0)),
      child: new Container(
        color: const Color(0xFFF0D5A9),
        padding: const EdgeInsets.all(gap),
        child: new Container(
          child: new Container(
            color: const Color(0xFF3C594E),
            child: child,
          ),
        ),
      ),
    );
  }
}