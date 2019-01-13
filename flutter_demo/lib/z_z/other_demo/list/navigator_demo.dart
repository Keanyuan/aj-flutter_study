import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NavigatorDemo extends StatefulWidget {
  NavigatorDemo({Key key}) : super(key: key);
  @override
  _NavigatorDemoState createState() => new _NavigatorDemoState();
}

class _NavigatorDemoState extends State<NavigatorDemo> {



  var buildList = [];


  @override
  void initState() {
    super.initState();

    setState(() {

    });
  }
  //new SwiperTController()
  @override
  Widget build(BuildContext context) {
    buildList = [];
    buildList.addAll([
      "Navigator无参",
      "Navigator传参",
    ]);







    return new Scaffold(
      appBar: new AppBar(
        title: new Text("NavigatorDemo"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return new Card(
            margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
            shape:  new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            color: Colors.white,
            child: new ListTile(
              title: new Text(buildList[index], style: TextStyle(color: Colors.grey),),
              onTap: (){
                switch(index){
                  case 0:
                    Navigator.push(context, new MaterialPageRoute(builder: (context) =>  NavigatorPage1()));
                    break;
                  case 1:
                    var result= Navigator.push(context, new MaterialPageRoute(builder: (context) =>  NavigatorPage2()));
                    result.then((v){
//                      Scaffold.of(context).showSnackBar(SnackBar(content:Text(' $v')));
                      Fluttertoast.showToast(msg: " $v", gravity: ToastGravity.CENTER);
                    });
                    break;
                  case 2:
                    break;
                  default:
                    break;
                }
              },
            ),
          );
        },
        itemCount: buildList.length,
      ),
    );
  }
}




class NavigatorPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigatorPage1State();
  }
}
class _NavigatorPage1State extends State<NavigatorPage1> {

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigator无参"),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pop(context);
        },
          child: Text("返回"),),
      ),
    );
  }
}


class NavigatorPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigatorPage2State();
  }
}
class _NavigatorPage2State extends State<NavigatorPage2> {

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigator传参"),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pop(context, "这是我传递的参数：Flutter 进阶");
        },
          child: Text("返回传参"),),
      ),
    );
  }
}
