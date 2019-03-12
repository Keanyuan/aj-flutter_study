import 'package:flutter/material.dart';
import 'package:flutter_demo/p_p/study/practice_dart.dart';
import 'package:flutter_demo/z_z/animarions_demo/animation_demo.dart';
import 'package:flutter_demo/z_z/layout_demo/layout_demo.dart';
import 'package:flutter_demo/z_z/other_demo/other_demo.dart';
import 'package:flutter_demo/z_z/widgets_list/widget_test.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {



  var buildList = [];

  List<Widget> controller = [];

  @override
  void initState() {
    super.initState();

    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  //new SwiperTController()
  @override
  Widget build(BuildContext context) {
    buildList = [];
    controller = [];
    buildList.addAll([
      "Widgets",
      "Layout",
      "Animation",
      "other",
      "Practice"
    ]);



    //------------------------


    controller.addAll([
      WidgetsListDemo(),
      LayoutWidgetDemo(),
      AnimationDemo(),
      OtherListDemo(),
      PracticeDartDemo(),
    ]);



    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
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