import 'package:flutter/material.dart';

//动画状态监听
class AnimationD extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnimationD> with SingleTickerProviderStateMixin {

  Animation<double> doubleAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    //通过CurvedAnimation我们可以实现动画的非线性播放，比如先快后慢 CurvedAnimation继承与Animation
    final CurvedAnimation curve = new CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    //无法改变Widget 只能生成一系列值
    doubleAnimation = new Tween(begin: 0.0, end: 300.0).animate(curve);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimAtion"),
      ),
      body: GrowTransition(child: new Image.asset("images/item2.png"), animation: doubleAnimation,),
    );
  }



  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
//使用AnimatedBuilder来构建动画Widget，其实跟前面的AnimatedWdiget是类似的。
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext context, Widget child){
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}