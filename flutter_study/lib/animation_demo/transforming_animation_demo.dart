import 'package:flutter/material.dart';

/*
* 从正方形逐渐变成圆形的动画
* */

class TransformingAnimationDemo extends StatefulWidget {
  @override
  _TransformingAnimationDemoState createState() => _TransformingAnimationDemoState();
}

class _TransformingAnimationDemoState extends State<TransformingAnimationDemo> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration:Duration(seconds: 5));
    animation = BorderRadiusTween(
        begin:BorderRadius.circular(0.0),
        end: BorderRadius.circular(120.0)
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen")),
      body: Container(
        color: Colors.amber,
        child: AnimatedBuilder(animation: animationController, builder: (BuildContext context, Widget child){
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: animation.value,
                color: Colors.blue
              ),
              width: 200.0,
              height: 200.0,
              child: Text(animation.value.toString()),
            ),
          );
        }),
      ),
    );
  }
}
