///// Timeseries chart example
//import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:flutter/material.dart';
//
//class FirstScreenController extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(
//          '第一个页面',
//          style: TextStyle(),
//          overflow: TextOverflow.ellipsis,
//        ),
//      ),
//      body: new Container(
//        width: 600.0,
//        height: 200.0,
//        child: SimpleTimeSeriesChart(SimpleTimeSeriesChart._createSampleData()),
//      ),
//    );
//  }
//}
//
//class SimpleTimeSeriesChart extends StatelessWidget {
//  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
//  final bool animate;
//
//  SimpleTimeSeriesChart(this.seriesList, {this.animate}):super();
//
//  @override
//  Widget build(BuildContext context) {
//    return new charts.TimeSeriesChart(
//      seriesList,
//      animate: animate,
//      dateTimeFactory: const charts.LocalDateTimeFactory(),
//    );
//  }
//
//
//  /// Create one series with sample hard coded data.
//  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
//    final data = [
//      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
//      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
//      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
//      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
//    ];
//
//    return [
//      new charts.Series<TimeSeriesSales, DateTime>(
//        id: 'Sales',
//        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//        domainFn: (TimeSeriesSales sales, _) => sales.time,
//        measureFn: (TimeSeriesSales sales, _) => sales.sales,
//        data: data,
//      )
//    ];
//  }
//}
//
///// Sample time series data type.
//class TimeSeriesSales {
//  final DateTime time;
//  final int sales;
//
//  TimeSeriesSales(this.time, this.sales);
//}
