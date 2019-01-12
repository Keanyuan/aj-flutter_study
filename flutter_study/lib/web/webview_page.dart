import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//TODO 公共的WebView页面，需要标题和URL参数
class WebPageBaseController extends StatefulWidget {

  String title;
  String url;

  WebPageBaseController({Key key, this.title, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebPageBaseState();
  }
}


class _WebPageBaseState extends State<WebPageBaseController> {
  bool loading = true;

  bool isRotating = false;
  //定义webview插件
  final flutterWebViewPlugin = new FlutterWebviewPlugin();


  @override
  void initState() {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
    // 监听WebView的加载事件
    flutterWebViewPlugin.onStateChanged.listen((state){
//      print(state.type);

//      // 加载开始
//      if (state.type == WebViewState.shouldStart){
//        setState(() {
//          loading = true;
//        });
//      }
//
//      // 加载完成
//      if (state.type == WebViewState.finishLoad){
//        setState(() {
//          loading = false;
//        });
//      }

    });
    // 监听WebView的url加载事件
    flutterWebViewPlugin.onUrlChanged.listen((url){
      setState(() {
        loading = false;
      });
    });

    flutterWebViewPlugin.onScrollYChanged.listen((double offsetY) {
//      print('offsetY $offsetY');
    });

    flutterWebViewPlugin.onScrollXChanged.listen((double offsetX) {
//      if(this.isRotating){
//        print("-----this.isRotating : ${this.isRotating}");
//
//        final width_srcreen = MediaQuery.of(context).size.width;
//        final height_screen = MediaQuery.of(context).size.height;
//        this.flutterWebViewPlugin.launch(widget.url,
//            rect: new Rect.fromLTWH(
//                0.0, 0.0, width_srcreen, height_screen));
//        this.isRotating = false;
//      }
//      print("offsetX----this.isRotating1 : ${this.isRotating}");

//      print('offsetX $offsetX');
    });
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
    flutterWebViewPlugin.close();
    flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      widget.title,
      style: new TextStyle(color: Colors.white),
    ));
    if(loading){
      titleContent.add(new CupertinoActivityIndicator());
    }

    titleContent.add(new Container(width: 50.0,));

    final width_srcreen = MediaQuery.of(context).size.width;
    final height_screen = MediaQuery.of(context).size.height;

    this.isRotating = true;


    return new Container(
      width: width_srcreen,
      height: height_screen,
      child: new WebviewScaffold(
        url: widget.url,
      appBar: new AppBar(
        leading: new GestureDetector(
          child: new Icon(Icons.arrow_back_ios),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          new GestureDetector(
            child: new Icon(Icons.more_horiz),
            onTap: (){
            },
          )
        ],
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
        scrollBar: true,
      ),
    );




  }
}




class ListenNotifucation extends Notification {
  ListenNotifucation({@required this.isPrtrait});
  final bool isPrtrait;
}