
import 'package:flutter/material.dart';
import 'package:flutter_study/widgets_test/custom_gradient_button.dart';
import 'package:flutter_study/z_z/layout_demo/list/row_demo.dart';

class RaisedButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<RaisedButtonDemo> {

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Button"),
      ),
      body: ListView(padding: EdgeInsets.all(10),children: <Widget>[
        CustomText("RaisedButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        RaisedButton(
          child: Text("normal"),
          onPressed: () => {},
        ),
        CustomText("FlatButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        FlatButton(
          child: Text("normal"),
          onPressed: () => {},
        ),
        CustomText("OutlineButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        OutlineButton(
          child: Text("normal"),
          onPressed: () => {},
        ),
        CustomText("IconButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () => {},
        ),
        CustomText("Custom FlatButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.red,
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () => {},
        ),
        CustomText("Custom RaisedButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.red,
          child: Text("Submit"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () => {},
        ),
        CustomText("Custom OutlineButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        OutlineButton(
          textColor: Colors.blue,
          splashColor: Colors.red,
          borderSide: BorderSide(color:  Colors.blue),
          child: Text("Submit"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () => {},
        ),
        CustomText("Custom ColorsButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        GradientButton(
          colors: [Colors.orangeAccent,Colors.red,Colors.purple],
          height: 50.0,
          child: Text("Submit"),
          radius: 30.0,
          onTap:(){} ,
        ),
        CustomText("Custom ColorsButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        GradientButton(
          colors: [Colors.red, Colors.blueAccent, Colors.yellow],
          height: 50.0,
          child: Text("Submit"),
          radius: 30.0,
          onTap:(){} ,
        ),
        CustomText("Custom ColorsButton", backgroundColor: Colors.transparent, color: Colors.red, fontSize: 18,),
        GradientButton(
          colors: [Colors.lightBlue[300], Colors.blueAccent],
          height: 50.0,
          child: Text("Submit"),
          radius: 30.0,
          onTap:(){} ,
        )



      ],),

    );
  }
}