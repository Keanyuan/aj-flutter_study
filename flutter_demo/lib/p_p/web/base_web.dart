
import 'package:flutter/material.dart';
import '../web/ChartsWebPage.dart';
import '../web/webview_page.dart';

class WebBasePagea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}

class _MyHomePageState extends State<WebBasePagea> {



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
//      "ChartsWebPage",
//      "WebPageBaseController",
    ]);



    controller.addAll([
//      ChartsWebPage(),
//      WebPageBaseController(title: "echars", url: "https://www.baidu.com")

    ]);



    return new Scaffold(
      appBar: new AppBar(
        title: new Text("图表"),
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