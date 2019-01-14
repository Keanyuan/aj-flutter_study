
import 'package:flutter/material.dart';

class RowDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<RowDemo> {

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
        title: new Text("Row"),
      ),
      body: ListView(padding: EdgeInsets.all(10),children: <Widget>[
        RowWidget(
          height: 400,
          mainAxisAlignment: MainAxisAlignment.spaceAround,//表示子Widgets在纵轴方向的对齐方式
          crossAxisAlignment: CrossAxisAlignment.start,//表示子Widgets在纵轴方向的对齐方式
        ),

        CustomText("MainAxisAlignment", backgroundColor: Colors.white, color: Colors.red, fontSize: 26,),
        CustomText(".start"),
        RowWidget(mainAxisAlignment: MainAxisAlignment.start,),
        CustomText(".center"),
        RowWidget(mainAxisAlignment: MainAxisAlignment.center,),
        CustomText(".end"),
        RowWidget(mainAxisAlignment: MainAxisAlignment.end,),
        CustomText(".spaceBetween"),
        RowWidget(mainAxisAlignment: MainAxisAlignment.spaceBetween,),
        CustomText(".spaceEvenly"),
        RowWidget(mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
        CustomText(".spaceAround"),
        RowWidget(mainAxisAlignment: MainAxisAlignment.spaceAround,),
        CustomText("Expanded弹性"),
        RowExpandedWidget(),
      ],),
    );
  }
}



class RowWidget extends StatefulWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final double height;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RowWidgetState();
  }

  RowWidget({this.height, this.crossAxisAlignment = CrossAxisAlignment.start, this.mainAxisAlignment = MainAxisAlignment.start});
}

class _RowWidgetState extends State<RowWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: widget.height,
      width: double.infinity,
      color: Colors.grey,
      child: Row(
          crossAxisAlignment:widget.crossAxisAlignment,//表示子Widgets在纵轴方向的对齐方式 十字交叉对齐
          mainAxisAlignment: widget.mainAxisAlignment,//表示子Widgets在Row所占用的水平空间内对齐方式
          textDirection: TextDirection.ltr, //布局顺序(是ltr从左往右还是rtl从右往左)
          mainAxisSize: MainAxisSize.max,//表示Row在主轴(水平)方向占用的空间
          verticalDirection: VerticalDirection.down,//表示Row纵轴（垂直）的对齐方向，表示从上到下。
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: Colors.red,
              child: Text('红色按钮'),
            ),
            RaisedButton(
              onPressed: () {
                print('点击黄色按钮事件');
              },
              color: Colors.yellow,
              child: Text('黄色按钮'),
            ),
            RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: Colors.green,
              child: Text('绿色按钮'),
            ),
          ]),);
  }

}


class RowExpandedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RowExpandedWidgetState();
  }
}

class _RowExpandedWidgetState extends State<RowExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children: <Widget>[
      Expanded(
        flex: 1, //可以按比例“扩伸”Row、Column和Flex子widget所占用的空间
        child: RaisedButton(
          onPressed: () {
            print('点击红色按钮事件');
          },
          color: Colors.red,
          child: Text('红色按钮'),
        ),
      ),
      Expanded(
        flex: 2,
        child: RaisedButton(
          onPressed: () {
            print('点击黄色按钮事件');
          },
          color: Colors.yellow,
          child: Text('黄色按钮'),
        ),
      ),
      Expanded(
        flex: 1,
        child: RaisedButton(
          onPressed: () {
            print('点击粉色按钮事件');
          },
          color: Colors.green,
          child: Text('绿色按钮'),
        ),
      ),
    ]);
  }

}


class CustomText extends StatelessWidget {

  final String data;
  final double fontSize;
  final Color color;
  final Color backgroundColor;



  CustomText(this.data, {this.fontSize = 18, this.color = Colors.white, this.backgroundColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children: <Widget>[
      Container(margin: EdgeInsets.symmetric(vertical: 10),color: backgroundColor, child: Text(this.data, style: TextStyle(fontSize: fontSize, color: color),),alignment: Alignment.center,),
      Container(),
    ],);
  }

}