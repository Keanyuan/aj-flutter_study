import 'package:flutter/material.dart';
import 'package:flutter_demo/z_z/main_page.dart';

void main() => runApp(MyApp());
//void main() {
//  return runApp(MyApp());
//}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // MainPage
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter;

  // TODO: 改变状态
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  void initState() {
    super.initState();
    print("initState");
    _counter = 0;
  }

  //将并改变依赖关系 调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("build");


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) =>  AppPage()));
            }, child: Text("按钮"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }


  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");

  }


  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");

  }


  @override
  void dispose() {
    super.dispose();

    print(dispose);


  }
}


class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("标题"), ),
      body: Container(color: Colors.white,),
    );
  }
}








class a extends StatefulWidget {
  @override
  _aState createState() => _aState();
}

class _aState extends State<a> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class b extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}









