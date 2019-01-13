import 'package:flutter/material.dart';
/**
 * 实现原理，使用AutomaticKeepAliveClientMixin，并重写wantKeepAlive方法，让状态不被回收掉。
 */

class KeepAiveHome extends StatefulWidget {
  KeepAiveHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<KeepAiveHome> with AutomaticKeepAliveClientMixin{
  int _counter = 0;

  Color my_color = Colors.red;
  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
  GlobalKey _globalKey = GlobalKey();
  GlobalKey _globalKey1 = GlobalKey();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_counter % 3 == 0){
      my_color = Colors.red;
    } else if(_counter % 3 == 1){
      my_color = Colors.green;
    } else {
      my_color = Colors.blue;
    }
    return new Scaffold(
      key: _globalKey,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(width: 100.0, height: 30.0, color: my_color,)
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        key: _globalKey1,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }


}