
import 'package:flutter/material.dart';
import 'package:flutter_study/web/ChartsWebPage.dart';
import 'package:flutter_study/web/webview_page.dart';

class ListViewWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewState();
  }
}

//动态列表 ListView.builder()
class _ListGenerateState extends State<ListViewWidgetDemo> {
  List<String> items;
  @override
  void initState() {
    super.initState();
    items = new List<String>.generate(1000, (i)=> "Item $i");
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
      body: new ListView.builder(
        itemBuilder: (context,index){
          return new ListTile(
            title:new Text('${items[index]}'),
          );
        },
        itemCount: items.length, ),
    );
  }
}

//ListView
class _ListViewState extends State<ListViewWidgetDemo> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var isVertical = true;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
      body: isVertical ? VerticalList() : HorizontalList(),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(height: 400, child: ListView(
      scrollDirection: Axis.horizontal,//垂直
      children: <Widget>[
        new Container(
          width:180.0,
          color: Colors.lightBlue,
        ), new Container(
          width:180.0,
          color: Colors.amber,
        ), new Container(
          width:180.0,
          color: Colors.deepOrange,
        ),new Container(
          width:180.0,
          color: Colors.deepPurpleAccent,
        ),
      ],),);;
  }

}

class VerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: ListView(
      scrollDirection: Axis.vertical,//水平
      children: <Widget>[
        new ListTile(
            leading:new Icon(Icons.access_time),
            title:new Text('access_time')
        ),
        new Divider(height: 1.0),
        new ListTile(
            leading:new Icon(Icons.account_balance),
            title:new Text('account_balance')
        ),
        new Divider(height: 1.0),
      ],),);
  }

}