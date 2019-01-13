import 'package:flutter/material.dart';
import 'package:flutter_demo/z_z/layout_demo/list/row_demo.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pin_input_text_field.dart';

class CustomInputDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}

class _MyHomePageState extends State<CustomInputDemo> {





  @override
  void initState() {
    super.initState();

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {




    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CustomInput"),
      ),
      body: ListView(padding: EdgeInsets.all(10),children: <Widget>[
        CustomText("CustomInputDemo"),
        PinInputTextField(
          onSubmit: (pin) {
            //Add submit action.
            Fluttertoast.showToast(msg: "输入结果为：$pin", gravity: ToastGravity.CENTER, timeInSecForIos: 2);

          },
          pinLength: 4,     // The length of the pin
          decoration: UnderlineDecoration(
              color: Colors.green,
              textStyle: TextStyle(color: Colors.red, fontSize: 25.0),
          ), // BoxTightDecoration or BoxLooseDecoration, UnderlineDecoration
          width: 300.0,
          height: 48.0,
        )
//        CustomText("Expanded弹性"),
//        ColumnExpandedWidget(),
      ],),
    );
  }
}