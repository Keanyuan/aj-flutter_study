import 'package:flutter/material.dart';

class BaseScaffod extends StatefulWidget {
  final String title;
  final Widget childBuilder;

  BaseScaffod({this.title, this.childBuilder});

  @override
  _BaseScaffodState createState() => new _BaseScaffodState();
}

class _BaseScaffodState extends State<BaseScaffod> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new ListView(children: <Widget>[
            new SizedBox(height: 250.0, child: widget.childBuilder),
          ])),
    );
  }
}