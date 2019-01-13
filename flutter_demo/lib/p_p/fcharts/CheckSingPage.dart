import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';
import '../sign/SignConfig.dart';



class CheckSingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckSingPageState();
  }

}

class _CheckSingPageState extends State<CheckSingPage> {

  var reqData;

  @override
  void initState() {
    super.initState();
    var params = {
      "name":"zhangsan",
      "age": {
        "password":"ccsdasd",
        "bage":"casdd",
        "carry":"casdd",
        "dest":"casdd",
        "earth":"casdd",
        "floor":5,
        "arc":"cdda"
      },
      "bage":3,
      "carry":5,
      "dest":"casdd",
      "earth":"casdd",
      "floor":"casdd",
    };
    var reqDataTemp = SignConfig.signData(params);
    reqData = reqDataTemp;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("数据解析"),
          actions: <Widget>[
            new GestureDetector(
              child: new Text("解析", style: TextStyle(fontSize: 18,color: Colors.red),),
              onTap: (){
                var params = {
                  "name":"lisi",
                  "age": {
                    "password":"fasfa",
                    "bage":"2",
                    "carry":"carry",
                    "dest":"dest",
                    "earth":"earth",
                    "floor":5,
                    "arc":"cycy"
                  },
                  "bage":3,
                  "carry":5,
                  "dest":"casdd",
                  "earth":"casdd",
                  "floor":"casdd",
                };
                var reqDataTemp = SignConfig.signData(params);
                setState(() {
                  reqData = reqDataTemp;
                });

              },
            )
          ],
        ),
        body:new Center(
          child: new Text("数据：${reqData}"),
        )
    );
    return Scaffold(
        appBar: AppBar(title: Text("CityLineChart"),),
        body:null
    );
  }
}