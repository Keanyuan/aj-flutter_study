
import 'package:flutter/material.dart';
import '../slider_screen/carousel_slider_demo.dart';
import '../InnerWidget/WidgetSummary.dart';
import '../bloc_demo/bolc_demo.dart';
import '../bottom_appBar_demo/bottom_appBar_demo.dart';
import '../chip_demo/chip_demo.dart';
import '../custom_router_transition/custom_router_transition.dart';
import '../draggable_demo/draggable_demo.dart';
import '../expansion_demo/expansion_demo.dart';
import '../fcharts/CheckSingPage.dart';
import '../fcharts/f_swiper.dart';
import '../fcharts/fcharts_base.dart';
import '../flutter_bottomnavigationbar/flutter_bottomnavigationbar.dart';
import '../frosted_glass_style_demo/frosted_glass_demo.dart';
import '../hero_demo/basic_structure_hero.dart';
import '../intro_views/intro_view_demo.dart';
import '../keep_alive_demo/keep_alive_demo.dart';
import '../list_view/cupertino_test.dart';
import '../overlay_demo/overlay_demo_list.dart';
import '../practice/SliverApp.dart';
import '../slider_screen/intro_slider_demo.dart';
import '../sliver_demo/sliver_demo.dart';
import '../spinkit_animation/spinkit_demo.dart';
import '../web/base_web.dart';
import '../web/webview_flutter_demo.dart';



class PracticeDartDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}

class _MyHomePageState extends State<PracticeDartDemo> {

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
    controller = [];
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
      CarouselSliderDemo(),
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
              title: new Text('${controller[index].runtimeType}', style: TextStyle(color: Colors.grey),),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) =>  controller[index]));
              },
            ),
          );
        },
        itemCount: controller.length,
      ),
    );
  }
}