
import 'package:flutter/material.dart';
import 'package:flutter_study/web/ChartsWebPage.dart';
import 'package:flutter_study/web/webview_page.dart';

class ContainerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<ContainerDemo> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Container"),
      ),
      body: Container(
        width: 300,
        height: 300,
        margin: EdgeInsets.only(left: 40, top: 20),
        padding: EdgeInsets.only(left:10, top: 20),
        alignment: Alignment.topCenter,
        child: Text("我是Container", style: TextStyle(color: Colors.white, fontSize: 30.0),),
//        color: Colors.red,
        decoration: new BoxDecoration(
          gradient: const LinearGradient( //线性渐变
            colors: [Colors.lightBlue,Colors.greenAccent,Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          border: Border.all(width: 2.0, color: Colors.purple),//外边框颜色
          borderRadius: BorderRadius.all(Radius.circular(30.0)) // elliptical(10, 20)椭圆
        ),
      ),
    );
  }
}