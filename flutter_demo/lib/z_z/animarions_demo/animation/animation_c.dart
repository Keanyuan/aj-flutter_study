import 'package:flutter/material.dart';

//动画状态监听
class AnimationC extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnimationC> with SingleTickerProviderStateMixin {

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
      })..addStatusListener((status){
        if(status == AnimationStatus.forward){
          print("开始动画");
        } else if(status == AnimationStatus.completed){
          print("结束动画");
          //反向执行
          animationController.reverse();
        } else if(status == AnimationStatus.dismissed){
          print("动画消失");
          animationController.forward();
        }
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
