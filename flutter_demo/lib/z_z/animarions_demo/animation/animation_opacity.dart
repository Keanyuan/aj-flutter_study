import 'package:flutter/material.dart';

//AnimatedOpacity
class AJAnimationOpacity extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<AJAnimationOpacity> with SingleTickerProviderStateMixin {

  double opacityLevel = 0.0;

  _changeOpacity(){
    setState(() {
      setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimAtion"),
      ),
      body: Center(child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new AnimatedOpacity(
              opacity: opacityLevel,
              curve: Curves.linear,
              duration: new Duration(seconds: 3),
              child: new FlutterLogo(size: 100.0,),
            ),
            SizedBox(height: 30.0,),
            new RaisedButton(onPressed: _changeOpacity,child: new Text("Go"),),
          ],
        ),),
    );
  }


}