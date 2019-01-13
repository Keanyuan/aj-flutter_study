import 'package:flutter/material.dart';
import '../bloc_demo/rxdart_demo/rxdart_demo.dart';
import '../bloc_demo/scoped_demo/scoped_demo.dart';
import '../bloc_demo/single_global_instance/single_global_instance.dart';
import '../chip_demo/action_chip.dart';
import '../chip_demo/chip.dart';
import '../chip_demo/choice_chip.dart';
import '../chip_demo/filter_chip.dart';
import '../chip_demo/input_chip.dart';



class ChipMoreDemo extends StatefulWidget {
  ChipMoreDemo({Key key}) : super(key: key);
  @override
  _AnimationDemoState createState() => new _AnimationDemoState();
}

class _AnimationDemoState extends State<ChipMoreDemo> {



  var buildList = [];

  List<Widget> controller = [];

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
    controller = [];
    buildList.addAll([
      "ChipDemo",
      "ActionChipDemo",
      "FilterChipDemo",
      "ChoiceChipDemo",
      "InputChipDemo",
    ]);




    //------------------------
    controller.addAll([
      // ignore: argument_type_not_assignable
      ChipDemo(),
      ActionChipDemo(),
      FilterChipDemo(),
      ChoiceChipDemo(),
      InputChipDemo()
      ],
    );





    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ChipDemo"),
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
                Navigator.push(context, new MaterialPageRoute(builder: (context) =>  controller[index]));
              },
            ),
          );
        },
        itemCount: buildList.length,
      ),
    );
  }
}