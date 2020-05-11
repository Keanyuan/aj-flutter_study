//import 'dart:math';
//// EXCLUDE_FROM_GALLERY_DOCS_END
//import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:flutter/material.dart';
//import 'package:charts_common/src/common/palette.dart' show Palette;
//import 'package:charts_common/src/common/color.dart' show Color;
//
//
//class MaterialCustomC extends Palette {
//  @override
//  charts.Color get shadeDefault => Color(r: 0x7F, g: 0x97, b: 0xF8);
//
////  charts.Color get shadeDefault => Color(r: 0x7A, g: 0xB1, b: 0xF9);
//
//
//}
//
//class AreaAndLineChart extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _AreaAndLineChartState();
//  }
//}
//
//class _AreaAndLineChartState extends State<AreaAndLineChart> {
//
//  List<AreaAndLineModel> data = [];
//  List<AreaAndLineModel> akedata = [];
//
//  List<charts.Series<AreaAndLineModel, num>>  seriesList = [];
//  @override
//  void initState() {
//    super.initState();
//    final random = new Random();
//    data = [
//      new AreaAndLineModel(0, random.nextInt(100)),
//      new AreaAndLineModel(1, random.nextInt(100)),
//      new AreaAndLineModel(2, random.nextInt(100)),
//      new AreaAndLineModel(3, random.nextInt(100)),
//    ];
//    akedata = [
//      new AreaAndLineModel(0, random.nextInt(100)),
//      new AreaAndLineModel(1, random.nextInt(100)),
//      new AreaAndLineModel(2, random.nextInt(100)),
//      new AreaAndLineModel(3, random.nextInt(100)),
//    ];
//
//    seriesList = [
//      new charts.Series<AreaAndLineModel, int>(
//          id: "Desktop",
//          data: data,
//          domainFn: (AreaAndLineModel sales, _){
//            return sales.year;
//          },
//          measureFn: (AreaAndLineModel sales, _){
//            return sales.sales;
//          },
//        colorFn: (_, __){
//
//            return MaterialCustomC().shadeDefault;
//        },
//        fillColorFn: (_, __){
//            return charts.MaterialPalette.deepOrange.shadeDefault;
//        }
//      )
//      ..setAttribute(charts.rendererIdKey, "customArea")
//      ,
////      new charts.Series<AreaAndLineModel, int>(
////          id: "Tablet",
////          data: akedata,
////          domainFn: (AreaAndLineModel sales, _){
////            return sales.year;
////          },
////          measureFn: (AreaAndLineModel sales, _){
////            return sales.sales;
////          },
////          colorFn: (_, __){
////            return charts.MaterialPalette.blue.shadeDefault;
////          }
////      )
////      ..setAttribute(charts.rendererIdKey, 'customArea')
//
//
//    ];
//    setState(() {
//
//    });
//
//  }
//
//  _onSelectionChanged(charts.SelectionModel model) {
//  }
//
//    @override
//  Widget build(BuildContext context) {
//
//    final children = <Widget>[
//      SizedBox(
//        height: 250.0 ,
//        child: new charts.LineChart(
//          seriesList,
//          animate: true,
//          customSeriesRenderers: [
//            //线渲染器配置
//            new charts.LineRendererConfig(
//              customRendererId: "customArea",
//              //是否在区域里包含颜色
//              includeArea: true,
//              stacked: true,
//              areaOpacity: 0.33,
//            )
//          ],
//        ),
//      )
//    ];
//
//    return new Container(
//      child: Column(
//        children: children,
//      ),
//    );
//
//    /*
//    new charts.LineChart(
//          seriesList,
//          animate: true,
//          behaviors: [new charts.PanAndZoomBehavior(),],
//          selectionModels: [
//            new charts.SelectionModelConfig(
//                type: charts.SelectionModelType.info,
//                listener: _onSelectionChanged
//            ),
//          ],
//        )
//    *
//    * */
//  }
//
//}
//
//
//class AreaAndLineModel {
//  final int year;
//  final int sales;
//
//  AreaAndLineModel(this.year, this.sales);
//}
//
//
