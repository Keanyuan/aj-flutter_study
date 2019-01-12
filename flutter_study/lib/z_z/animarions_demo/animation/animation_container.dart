import 'package:flutter/material.dart';

//动画的并行运行
class AnimationF extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//AnimatedContainer继承于ImplicitlyAnimatedWidget，相应的我们需要传入动画的播放时间（必须填写）和插值器类型（有默认值）
//然后，我们就可以让AnimatedContainer根据我们的值来做动画效果并且作用到相应的属性上。
class _MyHomePageState extends State<AnimationF> with SingleTickerProviderStateMixin {

  double animValue = 100.0;

  _changeValue(){
    setState(() {
      return animValue = animValue == 0 ? 100.0 : 0.0;
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
          new AnimatedContainer(
            duration: Duration(seconds: 3),
            curve: Curves.bounceOut,
            child: new FlutterLogo(size: 100.0,),
            padding: EdgeInsets.only(bottom: animValue),
          ),
          SizedBox(height: 30.0,),
          new RaisedButton(onPressed: _changeValue,child: new Text("Go"),),
        ],
      ),),
    );
  }


}