/**
 * 动画交叉淡出演示
 * 在AnimatedCrossFade中先确定好 firstChild和secondChild
 * 通过crossFadeState状态改变要显示first or second
 */

import 'package:flutter/material.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {

  bool _first = false;

  change(){
    setState(() {
      _first = _first ? false:true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedContainer")),
      body: Center(
        child: GestureDetector(
          onTap: change,
          child: AnimatedCrossFade(
              firstChild: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 200.0,),
              secondChild: FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0,),
              crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 2)),
        ),
      ),
    );
  }
}