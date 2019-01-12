import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<TextDemo> {

  @override
  void initState() {
    super.initState();

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {




    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text"),
      ),
      body: Center(
        child: Container(width: 300.0, height: 100.0, color: Colors.black12, child:
        Text("Hello Flutter ",
          textAlign: TextAlign.center,
          maxLines: 1,//行数
          overflow: TextOverflow.ellipsis,//溢出显示。。。
          style: TextStyle(
            color: Colors.red,//文字颜色
            fontSize: 40.0, //字体
            fontFamily: "Courier", //粗细
            background: new Paint()..color=Colors.yellow, //背景
            decoration: TextDecoration.lineThrough,//线条位置
            decorationStyle: TextDecorationStyle.double, //线条样式
            decorationColor: Colors.green, //线条颜色
          ),
        ),),)
    );
  }
}