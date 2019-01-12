import 'package:flutter/material.dart';
import 'package:flutter_study/animated_container/AnimatedContainerDemo.dart';
import 'package:flutter_study/animated_cross_fade/animated_cross_fade_demo.dart';

import 'package:flutter_study/animation_demo/delayed_animation_demo.dart';
import 'package:flutter_study/animation_demo/basic_animation_demo.dart';
import 'package:flutter_study/animation_demo/another_parent_animation_demo.dart';
import 'package:flutter_study/animation_demo/hidden_widget_animation_demo.dart';
import 'package:flutter_study/animation_demo/login_screen.dart';
import 'package:flutter_study/animation_demo/parent_animation_demo.dart';
import 'package:flutter_study/animation_demo/transforming_animation_demo.dart';
import 'package:flutter_study/animation_demo/value_change_animation_demo.dart';
import 'package:flutter_study/z_z/other_demo/list/navigator_demo.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animated_crossfade.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animation_a.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animation_b.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animation_c.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animation_container.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animation_d.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animation_e.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/animation_opacity.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/basic_hero_animation.dart';
import 'package:flutter_study/z_z/animarions_demo/animation/login_page_hero.dart';


class AnimationDemo extends StatefulWidget {
  AnimationDemo({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _AnimationDemoState createState() => new _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {



  var buildList = [];

  List<Widget> controller = [];

  @override
  void initState() {
    super.initState();

    setState(() {

    });
  }
  //new SwiperTController()
  @override
  Widget build(BuildContext context) {
    buildList = [];
    controller = [];
    buildList.addAll([
      "AnimationA",
      "AnimationB",
      "AnimationC",
      "AnimationD",
      "AnimationE",
      "AnimationF",

      "AJAnimationOpacity",
      "AJAnimatedCrossFade",

      "BasicHeroAnimation",
      "LoginPageHero",

      "LoginScreen",

      "LoginAnimation",

      "LoginDelayedAnimationDemo",
      "LoginHiddenWidgetAnimationDemo",
      "AnotherParentAnimationDemo",
      "DelayedAnimationDemo",
      "TransformingAnimationDemo",
      "ValueChangeAnimationDemo",
      "AnimatedContainerDemo",
      "AnimatedCrossFadeDemo",
    ]);



    //------------------------
    controller.addAll([
      AnimationA(),
      AnimationB(),
      AnimationC(),
      AnimationD(),
      AnimationE(),
      AnimationF(),
      AJAnimationOpacity(),
      AJAnimatedCrossFade(),
      BasicHeroAnimation(),
      LoginPage(),
      LoginScreen(),
      BasicAnimationDemo(),
      DelayedAnimationDemo(),
      ParentAnimationDemo(),

      AnotherParentAnimationDemo(),
      HiddenWidgetAnimationDemo(),
      TransformingAnimationDemo(),
      ValueChangeAnimationDemo(),
      AnimatedContainerDemo(),
      AnimatedCrossFadeDemo(),
    ]);



    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AnimationDemo"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return new Card(
            margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
            shape:  new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            color: Colors.white,
            child: new ListTile(
              title: new Text(buildList[index], style: TextStyle(color: Colors.grey),),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) =>  controller[index]));
              },
            ),
          );
        },
        itemCount: buildList.length,
      ),
    );
  }
}