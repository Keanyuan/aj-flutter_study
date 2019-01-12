
import 'package:flutter/material.dart';
import 'package:flutter_study/fcharts/CityLineChart.dart';
import 'package:flutter_study/fcharts/SparklineChart.dart';
import 'package:flutter_study/fcharts/f_charts.dart';
import 'package:flutter_study/fcharts/f_fchars.dart';
import 'package:flutter_study/fcharts/f_fchars1.dart';
import 'package:flutter_study/fcharts/AreaAndLineChart.dart';
import 'package:flutter_study/fcharts/BaseScaffod.dart';
import 'package:flutter_study/fcharts/ColumnarChart.dart';
import 'package:flutter_study/fcharts/LineAnimationZoomChart.dart';

class FchartsBasePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<FchartsBasePage> {



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
      "fcharts_折线图",
      "fchars_折线图2",
      "fchars_柱状堆叠图",
      "fchars_折线双线图",
      "fchars_折线图3",
      "柱状图",
      "fchars_折线点击",
      "fchars_阴影折线"
    ]);



    controller.addAll([
      FirstScreenController(),
      SimpleLineChart(),
      SimpleBarChart(),
      CityLineChart(),
      SparklineChart(),
      BaseScaffod(title: "柱状图", childBuilder: ColumnarChart(),),
      BaseScaffod(title: "LineAnimationZoomChart", childBuilder: LineAnimationZoomChart(),),
      BaseScaffod(title: "AreaAndLineChart", childBuilder: AreaAndLineChart(),)
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