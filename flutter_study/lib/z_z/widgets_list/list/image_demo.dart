
import 'package:flutter/material.dart';
import 'package:flutter_study/web/ChartsWebPage.dart';
import 'package:flutter_study/web/webview_page.dart';

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
//            fit: BoxFit.fitWidth,//缩放模式
//            color: Colors.yellow,//图片的混合色值
//            colorBlendMode: BlendMode.darken, //混合模式
            repeat: ImageRepeat.repeat,//repeat图片重复
//            alignment: Alignment.center,//对齐方式
          ),
        ),

        Container(margin: EdgeInsets.only(top: 10.0),width: 200, height: 300,color: Colors.black12,
          child: Image.network(
            "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp",
//            fit: BoxFit.fitWidth,//缩放模式
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