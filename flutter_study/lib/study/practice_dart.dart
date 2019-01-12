
import 'package:flutter/material.dart';
import 'package:flutter_study/InnerWidget/WidgetSummary.dart';
import 'package:flutter_study/bloc_demo/bolc_demo.dart';
import 'package:flutter_study/bottom_appBar_demo/bottom_appBar_demo.dart';
import 'package:flutter_study/chip_demo/chip_demo.dart';
import 'package:flutter_study/custom_router_transition/custom_router_transition.dart';
import 'package:flutter_study/draggable_demo/draggable_demo.dart';
import 'package:flutter_study/expansion_demo/expansion_demo.dart';
import 'package:flutter_study/fcharts/CheckSingPage.dart';
import 'package:flutter_study/fcharts/f_swiper.dart';
import 'package:flutter_study/fcharts/fcharts_base.dart';
import 'package:flutter_study/flutter_bottomnavigationbar/flutter_bottomnavigationbar.dart';
import 'package:flutter_study/frosted_glass_style_demo/frosted_glass_demo.dart';
import 'package:flutter_study/hero_demo/basic_structure_hero.dart';
import 'package:flutter_study/intro_views/intro_view_demo.dart';
import 'package:flutter_study/keep_alive_demo/keep_alive_demo.dart';
import 'package:flutter_study/list_view/cupertino_test.dart';
import 'package:flutter_study/overlay_demo/overlay_demo_list.dart';
import 'package:flutter_study/practice/SliverApp.dart';
import 'package:flutter_study/slider_screen/intro_slider_demo.dart';
import 'package:flutter_study/sliver_demo/sliver_demo.dart';
import 'package:flutter_study/spinkit_animation/spinkit_demo.dart';
import 'package:flutter_study/web/base_web.dart';
import 'package:flutter_study/web/webview_flutter_demo.dart';



class PracticeDartDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}

class _MyHomePageState extends State<PracticeDartDemo> {



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
      "小部件的总结",
      "轮播图",
      "数据解析",
      "SliverApp",
      "BlocDemo",
      "CupertinoDemo",
      "webView",
      "BottomAppBarDemo",
      "ChipMoreDemo",
      "CustomRouterTransitionPage",
      "DraggableDemo",
      "ExpansionDemo",
      "FlutterBottomnavigationbar",
      "FrostedGlassDemo高斯模糊",
      "SourceHeroPage",
      "IntroViewDemo",
      "KeepAliveDemo",
      "OverlayDemoList",
      "IntroSliderDemo",
      "SliverDemo",
      "SpinkitDemo",
      "WebViewExample",
      "图表",

    ]);

    controller.addAll([
      WidgetSummary(),
      SwiperTController(),
      CheckSingPage(),
      SliverApp(),
      BlocDemo(),
      CupertinoDemo(),
      WebBasePagea(),
      BottomAppBarDemo(),
      ChipMoreDemo(),
      CustomRouterTransition(),
      DraggableDemo(),
      ExpansionDemo(),
      FlutterBottomnavigationbar(),
      FrostedGlassDemo(),
      SourceHeroPage(),
      IntroViewDemo(),
      KeepAliveDemo(),
      OverlayDemoList(),
      IntroSliderDemo(),
      SliverDemo(),
      SpinkitDemo(),
      WebViewExample(),
      FchartsBasePage(),

    ]);



    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WidgetsList"),
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