
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {

  final String emptyTitle;
//按钮事件
  final VoidCallback onPress;

  EmptyWidget({this.emptyTitle, this.onPress});

  @override
  Widget build(BuildContext context) {

    return _buildEmpty(context);
  }

  ///空页面
  Widget _buildEmpty(context) {
    return new Container(
      height: MediaQuery.of(context).size.height - 100,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              this.onPress?.call();
            },
            child: new Icon(Icons.insert_emoticon),
          ),
          Container(
            child: Text(emptyTitle ?? "目前什么也没有", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

}