import 'package:flutter/material.dart';
import '../overlay_demo/overlay_demo.dart';
import '../overlay_demo/overlay_demo2.dart';



class OverlayDemoList extends StatefulWidget {
  OverlayDemoList({Key key}) : super(key: key);
  @override
  _AnimationDemoState createState() => new _AnimationDemoState();
}

class _AnimationDemoState extends State<OverlayDemoList> {



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
      "OverlayDemo1",
      "OverlayDemo2",
    ]);




    //------------------------
    controller.addAll([
      OverlayDemo1(),
      OverlayDemo2(),
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