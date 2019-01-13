import 'package:flutter/material.dart';

class AnimationA extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnimationA> with SingleTickerProviderStateMixin {

  Animation<double> doubleAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    //无法改变Widget 只能生成一系列值
    doubleAnimation = new Tween(begin: 0.0, end: 100.0).animate(animationController);
//      ..addListener((){
//        setState(() {
//          print(doubleAnimation.value);
//        });
//      });
  }


  _onAnimationStart(){
    animationController.forward(from: 0.0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimAtion"),
      ),
      body: Center( ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAnimationStart,
        tooltip: 'Increment',
        child: AnimationText(animation: doubleAnimation,),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

}

//通过AnimatedWidget我们可以直接获得动画的值并赋值给相应的Widget
//自定义一个AnimationText继承于AnimatedWidget来获得对动画的监听并给Text赋值
class AnimationText extends AnimatedWidget {
  AnimationText({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Text(animation.value.toInt().toString());
  }

}