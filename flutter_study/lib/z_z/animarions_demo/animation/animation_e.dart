import 'package:flutter/material.dart';

//动画的并行运行
class AnimationE extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnimationE> with SingleTickerProviderStateMixin {

  Animation<double> doubleAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    //无法改变Widget 只能生成一系列值
    doubleAnimation = new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimAtion"),
      ),
      body: AnimationLogo(animation: doubleAnimation,),
    );
  }



  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
//使用AnimatedBuilder来构建动画Widget，其实跟前面的AnimatedWdiget是类似的。
class AnimationLogo extends AnimatedWidget {

  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300);

  AnimationLogo({Key key, Animation<double> animation,}) : super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(child:
        //通过sizeAnimation.value来获取大小，通过opacityAnimation.value来获取不透明度
      new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
        ),
      ),
    );
  }

}