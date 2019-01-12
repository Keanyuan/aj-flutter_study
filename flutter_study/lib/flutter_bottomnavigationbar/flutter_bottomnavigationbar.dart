/**
 * 新增使用pageview实现方式：navigation——keep——alive
 * 这种方式能够通过子页面state实现AutomaticKeepAliveClientMixin
 * 达到切换各页面保持状态的效果。
 * 请切换home注释分别查看
 */
import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';

import 'navigation_keep_alive.dart';




class FlutterBottomnavigationbar extends StatefulWidget {
  FlutterBottomnavigationbar({Key key}) : super(key: key);
  @override
  _AnimationDemoState createState() => new _AnimationDemoState();
}

class _AnimationDemoState extends State<FlutterBottomnavigationbar> {



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
      "BottomNavigationWidget",
      "NavigationKeepAlive",
    ]);




    //------------------------
    controller.addAll([
      BottomNavigationWidget(),
      NavigationKeepAlive(),
    ],
    );





    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BlocDemo"),
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

