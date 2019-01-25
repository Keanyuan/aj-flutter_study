
import 'package:flutter/material.dart';

class ListViewWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListGenerateState();
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


    var _ListViewCustom = new CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                const Text('I\'m dedicating every day to you'),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart'),
                const Text('And I thought I was so smart'),
                const Text('I\'m dedicating every day to you'),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart'),
                const Text('And I thought I was so smart'),
              ])),
        )
      ],
    );

    //构建出现在子项之间的分隔符子项。此构造函数适用于具有固定数量的子控件的列表视图
    var _separated  = new ListView.separated(
        itemBuilder: (BuildContext context, int index) {
            return new ListTile(
              title:new Text('我是标题 ${items[index]}'),
  //            subtitle: new Text('我是描述 ${items[index]}'),
            );
          },
        separatorBuilder: (BuildContext context, int index) {
            return new Container(height: 1.0, color: Theme.of(context).dividerColor);
          },
        itemCount: items.length);


    var _listBuilder = new ListView.builder(
        itemBuilder: (context,index){
          return new ListTile(
            title:new Text('我是标题 ${items[index]}'),
    //            subtitle: new Text('我是描述 ${items[index]}'),
          );
        },
        itemCount: items.length,
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
      //这个构造函数适合于具有大量（或无限）子视图的列表视图，
      // /因为构建器只对那些实际可见的子视图调用。
      body: _listBuilder
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

    var isVertical = false;

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
      scrollDirection: Axis.horizontal,//水平
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
      scrollDirection: Axis.vertical,//滚动方向垂直
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