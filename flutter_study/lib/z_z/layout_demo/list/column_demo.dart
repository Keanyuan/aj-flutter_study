
import 'package:flutter/material.dart';
import 'package:flutter_study/z_z/layout_demo/list/row_demo.dart';

class ColumnDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}

class _MyHomePageState extends State<ColumnDemo> {





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
        title: new Text("Column"),
      ),
      body: ListView(padding: EdgeInsets.all(10),children: <Widget>[
        CustomText("MainAxisAlignment"),
        CustomRowTitleWidet(title1: ".start", title2: ".end",),
        CustomRowWidet(mainAxisAlignment: MainAxisAlignment.start, mainAxisAlignment1: MainAxisAlignment.end,),

        CustomRowTitleWidet(title1: ".center", title2: ".spaceBetween",),
        CustomRowWidet(mainAxisAlignment: MainAxisAlignment.center, mainAxisAlignment1: MainAxisAlignment.spaceBetween,),

        CustomRowTitleWidet(title1: ".spaceAround", title2: ".spaceEvenly",),
        CustomRowWidet(mainAxisAlignment: MainAxisAlignment.spaceAround, mainAxisAlignment1: MainAxisAlignment.spaceEvenly,),

        CustomText("Expanded弹性"),
        Container(color: Colors.black12,height: 200.0, child: ColumnExpandedWidget(),),
//        CustomText("Expanded弹性"),
//        ColumnExpandedWidget(),
      ],),
    );
  }
}


class CustomRowTitleWidet extends StatelessWidget {
  final String title1;
  final String title2;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CustomText(title1, fontSize: 14,),
        CustomText(title2, fontSize: 14)],);
  }

  CustomRowTitleWidet({this.title1, this.title2});

}

class CustomRowWidet extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisAlignment mainAxisAlignment1;
  final CrossAxisAlignment crossAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(color: Colors.black12, height: 200.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ColumnWidget(mainAxisAlignment: mainAxisAlignment, crossAxisAlignment: crossAxisAlignment,),
          ColumnWidget(mainAxisAlignment: mainAxisAlignment1, crossAxisAlignment: crossAxisAlignment1)],
      ), );
  }

  CustomRowWidet({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisAlignment1 = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.crossAxisAlignment1 = CrossAxisAlignment.start,
  });

}

class ColumnWidget extends StatefulWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ColumnWidgetState();
  }

  ColumnWidget({this.crossAxisAlignment = CrossAxisAlignment.start, this.mainAxisAlignment = MainAxisAlignment.start});
}

class _ColumnWidgetState extends State<ColumnWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment:widget.crossAxisAlignment,
        mainAxisAlignment: widget.mainAxisAlignment,
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
    ]);
  }

}


class ColumnExpandedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RowExpandedWidgetState();
  }
}

class _RowExpandedWidgetState extends State<ColumnExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(textBaseline: TextBaseline.alphabetic,children: <Widget>[
      RaisedButton(
        onPressed: () {
          print('点击红色按钮事件');
        },
        color: Colors.red,
        child: Text('红色按钮'),
      ),
      Expanded(
        flex: 1,
        child: RaisedButton(
          onPressed: () {
            print('点击黄色按钮事件');
          },
          color: Colors.yellow,
          child: Text('黄色按钮'),
        ),
      ),
      RaisedButton(
        onPressed: () {
          print('点击粉色按钮事件');
        },
        color: Colors.green,
        child: Text('绿色按钮'),
      ),
    ]);
  }

}
