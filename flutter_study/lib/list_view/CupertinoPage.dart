import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CupertinoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CupertinoPageState();
  }

}

class _CupertinoPageState extends State<CupertinoPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              horizontalList(),
            ]),
          ),
        ],
      ),
    );
  }


  Widget horizontalList() {
    //CupertinoDialogAction(child: Text("测试"), isDefaultAction: true,);
    //CupertinoTimerPicker(onTimerDurationChanged: (c){})
    return Container(
      height: 300.0,
      color: Colors.grey[300],
      child: CupertinoTimerPicker(onTimerDurationChanged: (c){}),
    );
  }

}