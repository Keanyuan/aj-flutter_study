import 'package:flutter/material.dart';

//控制View的大小
class AnimationB extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnimationB> with SingleTickerProviderStateMixin {

  Animation<double> doubleAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    //无法改变Widget 只能生成一系列值
    doubleAnimation = new Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener((){
        setState(() {
        });
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimAtion"),
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: doubleAnimation.value,
          width: doubleAnimation.value,
          child: new Image.asset("images/item2.png"),
        )),
    );
  }



  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
