import 'package:flutter/material.dart';
import 'package:flutter_demo/z_z/main_page.dart';

void main() => runApp(MyApp());

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



  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  void initState() {
    super.initState();

    setState(() {
      _counter = 0;
    });

  }

  @override
  Widget build(BuildContext context) {

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
}




//生命周期
class Animatontest extends StatefulWidget {
  @override
  _AnimatontestState createState() => _AnimatontestState();
}

class _AnimatontestState extends State<Animatontest> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    ///1.当插入渲染树的时候调用，这个函数在生命周期中只调用一次。
    ///这里可以做一些初始化工作，比如初始化State的变量。
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ///2.这个函数会紧跟在initState之后调用，
    ///并且可以调用BuildContext.inheritFromWidgetOfExactType
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didUpdateWidget(Animatontest oldWidget) {
    super.didUpdateWidget(oldWidget);
    //3.当组件的状态改变的时候就会调用didUpdateWidget,比如调用了setState.
    ///实际上这里flutter框架会创建一个新的Widget,绑定本State，并在这个函数中传递老的Widget。
    ///这个函数一般用于比较新、老Widget，看看哪些属性改变了，并对State做一些调整。
    ///需要注意的是，涉及到controller的变更，需要在这个函数中移除老的controller的监听，
    ///并创建新controller的监听。
  }

  @override
  void deactivate() {
    super.deactivate();
    //4.在dispose之前，会调用这个函数。
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    //5.一旦到这个阶段，组件就要被销毁了，这个函数一般会移除监听，清理环境。
  }

}

//有状态Widget
class StateFlulPage extends StatefulWidget {
  @override
  _StateFlulPageState createState() => _StateFlulPageState();
}

class _StateFlulPageState extends State<StateFlulPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//无状态Widget
class StateLessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


