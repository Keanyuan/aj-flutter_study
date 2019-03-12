import 'package:flutter/material.dart';
class TabledDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new  _TabledDemo();
  }
}
class _TabledDemo extends State<TabledDemo>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(this.toString()),),
      body: new Table(
//        columnWidths: const <int, TableColumnWidth>{
//          0: FixedColumnWidth(50.0),
//          1: FixedColumnWidth(100.0),
//          2: FixedColumnWidth(50.0),
//          3: FixedColumnWidth(100.0),
//        },
        border: new TableBorder.all(width: 1.0,color: Colors.purpleAccent),
        children: <TableRow>[
          new TableRow(
            decoration: BoxDecoration(color: Colors.amber),
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: Container(height: 100, child: new Text('设置1'),),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
          new TableRow(
            children: <Widget>[
              new TableCell(
                child: new Center(
                  child: new Text('设置1'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置2'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置3'),
                ),
              ),
              new TableCell(
                child: new Center(
                  child: new Text('设置4'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}