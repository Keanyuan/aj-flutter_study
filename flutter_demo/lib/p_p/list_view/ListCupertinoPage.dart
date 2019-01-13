
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import '../practice/CupertinoAlertDemo.dart';
import '../practice/CupertinoPickerDemo.dart';
import '../practice/GridListPage.dart';


class ListCupertinoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListCupertinoPageState();
  }
}

class _ListCupertinoPageState extends State<ListCupertinoPage> {

  GlobalKey<ScaffoldState> scaffoldKey;
  _ListCupertinoPageState() : super();

  //初始化的用户名和密码  首先是将用户名和密码存储在本地缓存中
  @override
  void initState() {
    super.initState();
    scaffoldKey = new GlobalKey<ScaffoldState>();
    assets = <String>[
      'Sublist',
      '底部弹框',
      '底部弹框1',
      '图片浏览',
      'Alert',
      'Picker',
    ];
  }

  int rvalue = 100;

  List<Widget> _buildRadioList(){
    List<String> list = ["aaa", "bbb", "cccc"];
    List<Widget> text = [];
    for(int i = 0; i< list.length; i ++){
      var item = list[i];


      text.add(
          new RadioListTile(
            value: i,
            groupValue: rvalue,
            onChanged: (v){
              print(list[v]);
              setState(() {
                rvalue = v;
              });
            },
            title: new Text(item),
          )
      );
    }
    return text;
  }


  List<String> assets;
  String dropdown3Value = 'Four';
  bool iconButtonToggle = false;

  //todo  列表遍历
  Widget _buildAssetsWidget(BuildContext context){
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
      children: assets.map<Widget>((String asset){
        if(asset == assets[0]) {
          return ExpansionTile(
              title: const Text('Sublist'),
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              children: const <Widget>[
                ListTile(title: Text('One')),
                ListTile(title: Text('Two')),
                // https://en.wikipedia.org/wiki/Free_Four
                ListTile(title: Text('Free')),
                ListTile(title: Text('Four'))
              ]
          );
        }
        return GestureDetector(
          onTap: (){
            if(asset == assets[1]){
//              Scaffold.of(context).showSnackBar(
//                const SnackBar(content: Text('This is a dummy search action.')),
//              );
              showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
                return Container(
                    child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text('This is the modal bottom sheet. Tap anywhere to dismiss.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 24.0
                            )
                        )
                    )
                );
              });


            } else if(asset == assets[2]){
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.search),
                              title: Text('Search'),
                            ),
                            ListTile(
                              leading: Icon(Icons.threed_rotation),
                              title: Text('3D'),
                            ),
                            RaisedButton.icon(
                              onPressed: (){
                              },
                              icon: const Icon(Icons.forward, size: 18.0),
                              label: const Text("RAISED BUTTON"),
                            ),
                            FlatButton(
                              child: const Text('FLAT BUTTON'),
                              onPressed: () {
                                // Perform some action
                              },
                            ),
                            OutlineButton.icon(
                              icon: const Icon(Icons.add, size: 18.0),
                              label: const Text('OUTLINE BUTTON'),
                              onPressed: () {
                                // Perform some action
                              },
                            ),
                            DropdownButton<String>(
                              value: dropdown3Value,
                              onChanged: (String newValue) {
                                print(newValue);
                                setState(() {
                                  dropdown3Value = newValue;
                                });
                              },
                              items: <String>[
                                'One', 'Two', 'Free', 'Four', 'Can', 'I', 'Have', 'A', 'Little',
                                'Bit', 'More', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'
                              ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            FloatingActionButton(
                              child: const Icon(Icons.add),
                              onPressed: () {
                                // Perform some action
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );
            } else if(asset == assets[3]){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new GridListPage()));
            }else if(asset == assets[4]){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new CupertinoAlertDemo()));
            } else if(asset == assets[5]){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new CupertinoPickerDemo()));
            }
//




          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  width: 140.0,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        alignment: AlignmentDirectional.center,
                        child: Text(asset, style: TextStyle(color: Colors.red),),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0,)
            ],
          ),
        );
      }).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("hhh"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.thumb_up,
              semanticLabel: 'Thumbs up',
            ),
            onPressed: () {
              setState(() => iconButtonToggle = !iconButtonToggle);
            },
            color: iconButtonToggle ? Colors.red : null,
          ),
        ],
      ),
      body: _buildAssetsWidget(context),
    );
  }

}
