
import 'package:flutter/material.dart';


class StackDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}
class _MyHomePageState extends State<StackDemo> {

  //new SwiperTController()
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      alignment: const FractionalOffset(0, 0),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('http://img.zcool.cn/community/01576a57182c4e32f8758c9b47a72f.jpg'),
//          child: ClipOval(child: Image.asset("images/pic8.jpg",),),
          radius: 200.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.orangeAccent,
          ),
          padding: EdgeInsets.all(5.0),
          child: new Text('这是堆叠层上层', style: TextStyle(color: Colors.white, fontSize: 24),),
        ),
        new Positioned(
          left:20.0,
          top:30.0,
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.lightBlue,
            ),
            padding: EdgeInsets.all(5.0),
            child: new Text('这是Positioned', style: TextStyle(color: Colors.white, fontSize: 24),),
          ),
        )
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stack"),
      ),
      body: Center(child:stack),
    );
  }
}