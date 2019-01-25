
import 'package:flutter/material.dart';

class ImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<ImageDemo> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("image"),
      ),
      body: ListView(children: <Widget>[
        Container(margin: EdgeInsets.only(top: 10.0),width: 200, height: 300,color: Colors.black12,
          child: Image.asset(
            "images/pic8.jpg",
            fit: BoxFit.fitWidth,//缩放模式
//            color: Colors.red,//图片的混合色值
            colorBlendMode: BlendMode.darken, //混合模式
//            repeat: ImageRepeat.repeat,//repeat图片重复
//            alignment: Alignment.center,//对齐方式
          ),
        ),

        Container(margin: EdgeInsets.only(top: 10.0),width: 200, height: 300,color: Colors.black12,
          child: Image.network(
            "http://pic1.nipic.com/2008-12-30/200812308231244_2.jpg",
            fit: BoxFit.fitWidth,//缩放模式
//            color: Colors.yellow,//图片的混合色值
//            colorBlendMode: BlendMode.darken, //混合模式
//            repeat: ImageRepeat.repeat,//repeat图片重复
//            alignment: Alignment.center,//对齐方式
          )
        ),



      ],),
    );
  }
}