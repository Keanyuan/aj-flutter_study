
import 'package:flutter/material.dart';


class CardDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}
class _MyHomePageState extends State<CardDemo> {

  List<String> items;
  @override
  void initState() {
    super.initState();
    items = new List<String>.generate(1000, (i)=> "Item $i");
    setState(() {
    });
  }
  //new SwiperTController()
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stack"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return new Card(
            margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
            shape:  new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            color: Colors.white,
            child: new ListTile(
              title: new Text(items[index], style: TextStyle(color: Colors.grey),),
              onTap: (){
//              Navigator.push(context, new MaterialPageRoute(builder: (context) =>  controller[index]));
              },
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}