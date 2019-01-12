
import 'package:flutter/material.dart';

class WrapWidgetDemo extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


//提示程序提供状态混合
//TickerProviderStateMixin
class _MyHomePageState extends State<WrapWidgetDemo> {

  List<String> buttonList = [];

  @override
  void initState() {
    super.initState();

     buttonList = ["斗罗大陆", "遮天", "盗墓笔记", "天龙八部天龙八部", "凡人修真", "大主宰", "仙逆", "斗鱼", "校花贴身高手", "酒神", "最好的我们"];
     setState(() {
     });
  }
  @override
  Widget build(BuildContext context) {
    buttonList = ["斗罗大陆", "遮天", "盗墓笔记", "天龙八部", "凡人修真", "大主宰", "仙逆", "斗鱼", "校花贴身高手", "酒神", "最好的我们"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: buttonList.map<MyButton>((value){
            return MyButton(value);
          }).toList(),

        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final text;

  MyButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      child: OutlineButton(
        borderSide: BorderSide(
            color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
        disabledBorderColor: Colors.grey,
        highlightedBorderColor: Colors.redAccent,
        onPressed: () {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: Row(children: <Widget>[
              new Text(text),
              Tooltip(
                  message: "点击删除",
                  preferBelow: false,
                  verticalOffset: 30.0,
                  padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                  height: 100.0,
                  child: Icon(
                    Icons.delete,
                    size: 50.0,
                  )),
            ],),
            action: new SnackBarAction(
              label: "撤回",
              onPressed: () {},
            ),
          ));
        },
        child: Text(text),
      ),
//        child: RaisedButton(
//          highlightColor: Colors.red,
//          splashColor: Colors.lightBlue,
//          onPressed: () {
//            Scaffold.of(context).showSnackBar(new SnackBar(
//              content: new Text(text),
//              action: new SnackBarAction(
//                label: "撤回",
//                onPressed: () {},
//              ),
//            ));
//          },
//          child: Text(text),
//        ),
    );
  }
}