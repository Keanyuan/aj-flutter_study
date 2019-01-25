import 'dart:async';
import 'dart:io';

import 'package:aj_flutter_plugin/aj_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/z_z/main_page.dart';
import 'package:flutter_demo/z_z/widgets_list/list/bottom_sheet_fix.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());
//void main() {
////  return runApp(MyApp());
////}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS //滑动返回
      ),
      // MainPage
      home: MyHomePagea(title: 'Flutter Demo Home Page'),
//      routes: {
//          "/": (_) => new WebViewScaffold(
//            url: "https://www.google.com",
//            appBar: new AppBar(
//              title: new Text("Widget webview"),
//            ),
//          )
//        }
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





class MyHomePagea extends StatefulWidget {
  MyHomePagea({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageaState createState() => _MyHomePageaState();
}

class _MyHomePageaState extends State<MyHomePagea> {
  String _platformVersion = 'Unknown';


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    AjFlutterPlugin info;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      info = await AjFlutterPlugin.platformVersion();
      platformVersion = "appName:${info.appName}\n"
          + "packageName: ${info.packageName}\n"
          + "version:${info.version}\n"
          + "buildNumber:${info.buildNumber}";

      print(platformVersion);

    } catch (e) {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {


    return WebviewScaffold(
      url: "http://mirror.anji-plus.com/appChart?token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5IiwiZXhwIjoxNTUwOTcwNzkzfQ.RBzjN0-AsQ5c7jASPAWqUTyK69mEqYohxhhx_phZa5klRNBRAInHw_-BJZXP0qSuX12IxvTcQ5PmULxyf3hDwA&chartType=line&chartId=48&connectName=0",
      appBar: AppBar(title: Text("title"),),
    );

    return Scaffold(
      appBar: AppBar(title: Text("title"),),
      body: WebView(
        initialUrl: "http://mirror.anji-plus.com/appChart?token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5IiwiZXhwIjoxNTUwOTcwNzkzfQ.RBzjN0-AsQ5c7jASPAWqUTyK69mEqYohxhhx_phZa5klRNBRAInHw_-BJZXP0qSuX12IxvTcQ5PmULxyf3hDwA&chartType=line&chartId=48&connectName=0",
        javaScriptMode: JavaScriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('hhh')),
      body: ListView(children: <Widget>[
        Text('$_platformVersion\n'),
        FlatButton(onPressed: () async{
          if(Platform.isAndroid){
            await launch("https://www.pgyer.com/Ti9R");
          } else if(Platform.isIOS){
            await launch("http://itunes.apple.com/cn/app/id1441492772");
          }
        }, child: Text("点击")),

      ],),
//      floatingActionButton: FloatingActionButton(onPressed: () {
//        showModalBottomSheetApp(
//            context: context,
//            builder: (context) {
//              return SizedBox(
//                height: 300.0,
//                child: Scaffold(
//                  body: ListView(children: <Widget>[
//                    Text('$_platformVersion\n'),
//                    FlatButton(onPressed: () async{
//                      if(Platform.isAndroid){
//                        await launch("https://www.pgyer.com/Ti9R");
//                      } else if(Platform.isIOS){
//                        await launch("http://itunes.apple.com/cn/app/id1441492772");
//                      }
//                    }, child: Text("点击")),
//
//                  ],),
//                ),
//              );
//            });
//      }),
    );
  }
}






