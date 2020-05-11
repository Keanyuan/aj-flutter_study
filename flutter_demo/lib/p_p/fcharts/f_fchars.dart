//
//import 'package:fcharts/fcharts.dart';
//import 'package:flutter/material.dart';
//
//class SimpleLineChart extends StatelessWidget {
//  // X value -> Y value
//  static const myData = [
//    ["1", "1"],
//    ["2", "2"],
//    ["3", "2"],
//    ["4", "7"],
//    ["5", "5"],
//    ["6", "6"],
//    ["7", "7"],
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: AppBar(title: Text("SimpleLine"),),
//      body: new AspectRatio(
//        aspectRatio: 4/3,
//        child: new LineChart(
//        lines: [
//          new Line<List<String>, String, String>(
//            data: myData,
//            xFn: (datum) => datum[0],
//            yFn: (datum) => datum[1],
//          ),
//        ],
//        chartPadding: new EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 30.0),
//      ),),
//    );
//  }
//}