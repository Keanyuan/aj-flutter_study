//import 'package:flutter/material.dart';
////import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter/cupertino.dart';
/////cupertino
//class ListViewDemo extends StatelessWidget {
//
//  Widget horizontalList() {
//    return Container(
//      height: 100.0,
//      color: Colors.grey[300],
//      child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//        itemBuilder: (context, index) {
//          return Container(
//            margin: EdgeInsets.all( 8.0 ),
//            padding: EdgeInsets.all( 8.0 ),
//            color: Colors.grey[200],
//            width: 120.0,
//            child: Center(
//              child: Text(
//                '$index',
//                style: Theme
//                    .of( context )
//                    .textTheme
//                    .title,
//              ),
//            ),
//          );
//        },
//        itemCount: 20,
//        shrinkWrap: true,
//        // todo comment this out and check the result
//        physics:
//        ClampingScrollPhysics( ), // todo comment this out and check the result
//      ),
//    );
//  }
//
//  Widget verticalList() {
//    List<String> listStr = ["Url跳转, ", "发邮件", "打电话", "TimePicker", "弹框1", "弹框2测试", "弹框3测试", "弹框4测试", "8"];
//    return ListView.builder(
//      padding: EdgeInsets.only( top: 8.0 ),
//      itemBuilder: (context, index) {
//        return new GestureDetector(
//          onTap: () async {
//            if (index == 0) {
//              const url = "https://www.baidu.com";
//              if (await canLaunch( url )) {
//                await launch( url );
//              }
//            } else if (index == 1) {
//              const pho = "sms:5550101234";
//              await launch( pho );
//            } else if (index == 2) {
//              const pho = "tel:13838838888";
//              if (await canLaunch( pho )) {
//                await launch( pho );
//              }
//            } else if (index == 3) {
//              showLoadingDialog(context, Container(
//                height: 400.0,
//                color: Colors.grey[300],
//                child: CupertinoTimerPicker(
//                    onTimerDurationChanged: (c) {
//                      print( c.toString( ) );
//                    } ),
//              ));
//            } else if (index == 4) {
//              showLoadingDialog(context, Container(
//                height: 400.0,
//                color: Colors.grey[300],
//                child: CupertinoActionSheetAction(onPressed: (){
//                  print("测试");
//                }, child: Text("哈哈哈")),
//              ));
//            } else if(index == 5){
//
//              showLoadingDialog(context, Container(
//                height: 400.0,
//                color: Colors.grey[300],
//                child: CupertinoActionSheet(
//                  title: Text("hahah"),
//                  cancelButton: new GestureDetector(
//                    child: Text("取消"),
//                    onTap: () {
//                      Navigator.pop( context );
//                    },
//                  ),
//                ),
//              ));
//            } else if(index == 6){
//              showLoadingDialog(
//                  context,
//                  Container(
//                    height: 400.0,
//                    color: Colors.grey[300],
//                    child: CupertinoAlertDialog(
//                      title: Text("Allow \"Maps\" to access your location while you use the apps?"),
//                      actions: <Widget>[
//                        Text("Don't Allow"),
//                        Text("Allow")
//                      ],
//                    ),
//                  )
//              );
//            } else if(index == 7) {
//              showLoadingDialog(
//                  context,
//                  Container(
//                    child: CupertinoAlertDialog(
//                      title: Text("Allow \"Maps\" to access your location while you use the apps?"),
//                      content: Text("your current location will be displayed on the map and used for directions, nearby search results, and estimated traval times"),
//                      actions: <Widget>[
//                        new GestureDetector(
//                          child: Container(
//                            margin: new EdgeInsets.all(15.0),
//                            child: Center(
//                              child: Text("Don't Allow"),
//                            ),
//                          ),
//                          onTap: (){
//                            Navigator.pop(context);
//                          },
//                        ),
//                        new GestureDetector(
//                          child: Container(
//                            margin: new EdgeInsets.all(15.0),
//                            child: Center(
//                              child: Text("Allow"),
//                            ),
//                          ),
//                          onTap: (){
//                            Navigator.pop(context);
//                          },
//                        )
//                      ],
//                    ),
//                  )
//              );
//
//            }else if(index == 8){
//
//            }
//          },
//          child: Container(
//            margin: EdgeInsets.all( 8.0 ),
//            padding: EdgeInsets.all( 8.0 ),
//            color: Colors.grey[200],
//            width: 120.0,
//            height: 120.0,
//            child: Center(
//              child: Text(
//                '${listStr[index]}',
//                style: Theme
//                    .of( context )
//                    .textTheme
//                    .title,
//              ),
//            ),
//          ),
//        );
//      },
//      itemCount: listStr.length,
//      shrinkWrap: true,
//      // todo comment this out and check the result
//      physics:
//      ClampingScrollPhysics( ), // todo comment this out and check the result
//    );
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text("Cupertino列表"),),
//      body: CustomScrollView(
//        slivers: <Widget>[
//          SliverList(
//            delegate: SliverChildListDelegate( [
////              Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
////                GestureDetector(child: Container(color: Colors.red, width: 60.0, height: 40.0,margin: EdgeInsets.only(top: 40.0,bottom: 20.0),child: Icon(Icons.arrow_back_ios),),onTap: (){
////                  Navigator.pop(context);
////                },),
////              ],),
//              horizontalList( ),
//              verticalList( ),
//            ] ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  static Future<Null> showLoadingDialog(BuildContext context, Widget widget) {
//    final widthSrcreen = MediaQuery.of(context).size.width;
//    final heightScreen = MediaQuery.of(context).size.height;
//    return showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return new Material(
//            color: Color.fromRGBO(0, 0, 0, 0),
//            child: GestureDetector(
//              onTap: (){
//                Navigator.pop(context);
//              },
//              child: new Container(
//                color: Color.fromRGBO(0, 0, 0, 0),
//                width: widthSrcreen,
//                height: heightScreen,
//                child: new Center(
//                  child: widget,
//                ),
//              ),
//            ),
//          );
//        });
//  }
//}
//
//
//class StateFullWidget extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    return _StateFullWidgetState();
//  }
//
//}
//
//class _StateFullWidgetState extends State<StatefulWidget> {
//
//  @override
//  void initState() {
//    ///① created 当State对象被创建时候，State.initState方法会被调用；
//    super.initState();
//  }
//
//  @override
//  void didChangeDependencies() {
//    ///② initialized：当State对象被创建，但还没有准备构建时，State.didChangeDependencies在这个时候会被调用
//    super.didChangeDependencies();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    ///③ State对象被完全的初始化了，调用build
//    // TODO: implement build
//  }
//
//  @override
//  void didUpdateWidget(StatefulWidget oldWidget) {
//    ///④如果有需要，会调用didUpdateWidget
//    super.didUpdateWidget(oldWidget);
//  }
//
//  @override
//  void dispose() {
//    ///⑤ ready：State对象已经准备好了构建，State.dispose没有被调用的时候
//    super.dispose();
//  }
//
//}