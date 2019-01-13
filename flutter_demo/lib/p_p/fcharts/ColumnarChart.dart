
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';



class ColumnarChart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final random = new Random();
    final data = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];
    final data1 = [
      new OrdinalSales('2014', random.nextInt(200)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    List<charts.Series<OrdinalSales, String>> seriesList= [
      new charts.Series(
        id: "Scales1",
        data: data,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),
//      new charts.Series(
//        id: "Scales2",
//        data: data1,
//        domainFn: (OrdinalSales sales, _) => sales.year,
//        measureFn: (OrdinalSales sales, _) => sales.sales,
//        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//      ),
    ];
    return new charts.BarChart(
      seriesList,
      animate: true,
      selectionModels: [
        new charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: (charts.SelectionModel model){
            final selectedDatum = model.selectedDatum;
            final measures = <String, int>{};

            if(selectedDatum.isNotEmpty){
//              print(selectedDatum.first.datum.sales);
//              print(selectedDatum.last.datum.sales);
            new Tooltip(message: "a");
              selectedDatum.forEach((charts.SeriesDatum datumPair) {
                print(datumPair.datum.year);
                print(datumPair.datum.sales);
              });
            }
          },
        )
      ],
    );
  }

}

/// Sample ordinal data type.
class OrdinalSales {
  //年
  final String year;
  //销售额
  final int sales;

  OrdinalSales(this.year, this.sales);
}