import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineAnimationZoomChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LineAnimationZoomChartState();
  }

}

class LineAnimationZoomChartState extends State<LineAnimationZoomChart> {

  LinearSales linearSales = LinearSales(0, 0, 0.0, null);

  List<LinearSales> data = [];
  List<charts.Series<LinearSales, num>>  seriesList = [];


  final blue = charts.MaterialPalette.blue.makeShades(2);
  final red = charts.MaterialPalette.red.makeShades(2);
  final green = charts.MaterialPalette.green.makeShades(2);
  @override
  void initState() {
    super.initState();
    final random = new Random();

     data = <LinearSales>[];

    for (var i = 0; i < 10; i++) {

      data.add(new LinearSales(i, random.nextInt(100), i % 2==0 ? 1.0 : 4.0, [2 , 2]));
    }
   seriesList =  [
//      new charts.Series<LinearSales, int>(
//        id: 'Sales',
//        domainFn: (LinearSales sales, _) => sales.year,
//        measureFn: (LinearSales sales, _) => sales.sales,
//        data: data,
//        colorFn: (LinearSales sales, _) =>
//            charts.MaterialPalette.green.makeShades(2)[1]
//      ),
      new charts.Series<LinearSales, int>(
        id: 'Color Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (LinearSales sales, _) =>
        sales.year % 2 == 0 ? blue[1] : blue[0],
        strokeWidthPxFn: (LinearSales sales, _) => sales.strokeWidthPx,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
    setState(() {
    });
  }


  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    final measures = <String, int>{};

    if(selectedDatum.isNotEmpty){
//              print(selectedDatum.first.datum.sales);
//              print(selectedDatum.last.datum.sales);

      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        print(datumPair.datum.year);
        print(datumPair.datum.sales);
        setState(() {
          linearSales = LinearSales(datumPair.datum.year, datumPair.datum.sales, datumPair.datum.strokeWidthPx, datumPair.datum.dashPattern,);
        });
      });
    }
  }



  @override
  Widget build(BuildContext context) {




    final children = <Widget>[
      SizedBox(
        height: 150.0,
        child: new charts.LineChart(
          seriesList,
          animate: true,
          behaviors: [new charts.PanAndZoomBehavior(),],
          selectionModels: [
            new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged
            ),
          ],
        ),
      )
    ];
    
    if (linearSales.sales != 0){
      children.add(SizedBox(height: 30.0, child: Container(
        color: Colors.red,
        child: Text("年份：${linearSales.year}  销售额： ${linearSales.sales}"),
      ),)
      );
    }
    
      return new Container(
      child: Column(
        children: children,
      ),
    );
  }

}



class LinearSales {
  final int year;
  final int sales;
  final double strokeWidthPx;
  final List<int> dashPattern;


  LinearSales(this.year, this.sales, this.strokeWidthPx, this.dashPattern);
}
