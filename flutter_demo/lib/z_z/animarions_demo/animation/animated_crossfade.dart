import 'package:flutter/material.dart';

//AnimatedCrossFade允许一个Widget到另为一个Widget使用渐变的改变。
///与 AnimatedOpacity和AnimatedContainer不同，AnimatedCrossFade直接继承于StatefulWidget，
/// 构造方法必须要传入两个不同的Widget，当然你也可以指定每个widget的动画差值器。
class AJAnimatedCrossFade extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<AJAnimatedCrossFade> with SingleTickerProviderStateMixin {

  bool _first = true;

  _changeOpacity(){
    setState(() {
      setState(() => _first = _first == false ? true : false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimAtion"),
      ),
      body: Center(child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new AnimatedCrossFade(
              firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0,),
              secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size:200.0,),
              crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(seconds: 2)),
          SizedBox(height: 30.0,),
          new RaisedButton(onPressed: _changeOpacity,child: new Text("Go"),),
        ],
      ),),
    );
  }


}