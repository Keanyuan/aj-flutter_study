
import 'package:flutter/material.dart';

import 'package:flutter_demo/z_z/animarions_demo/animation/custom_paint_route.dart';
import 'package:flutter_demo/z_z/animarions_demo/animation/gradient_circular_progress_route.dart';
import 'package:flutter_demo/z_z/animarions_demo/animation/turn_box_demo.dart';
import 'package:flutter_demo/z_z/other_demo/constom_view_canvas/custom_circle_progress.dart';
import 'package:flutter_demo/z_z/other_demo/constom_view_canvas/custom_image_view.dart';
import 'package:flutter_demo/z_z/other_demo/constom_view_canvas/custom_label_view.dart';
import 'package:flutter_demo/z_z/other_demo/constom_view_canvas/custom_view.dart';
import 'package:flutter_demo/z_z/other_demo/list/custom_inoput/custom_input_demo.dart';
import 'package:flutter_demo/z_z/other_demo/movie/movies_page.dart';
import 'package:flutter_demo/z_z/other_demo/list/navigator_demo.dart';
import 'package:flutter_demo/z_z/other_demo/list/sliver_appbar.dart';


class OtherListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}

class _MyHomePageState extends State<OtherListDemo> {



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
      "navigator",
      "AJSliverAppbar",
      "MyCustomInput",
      "MyCustomView",
      "CustomImageView",
      "MyCustomLabelView",
      "CustomCircleProgress",
      "TurnBoxRoute",
      "CustomPaintRoute",
      "GradientCircularProgressRoute",
      "MoviesPage",
    ]);



    controller.addAll([
      NavigatorDemo(),
      AJSliverAppbar(),
      CustomInputDemo(),
      MyCustomView(),
      CustomImageView(),
      MyCustomLabelView(),
      CustomCircleProgress(),
      TurnBoxRoute(),
      CustomPaintRoute(),
      GradientCircularProgressRoute(),
      MoviesPage(),
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