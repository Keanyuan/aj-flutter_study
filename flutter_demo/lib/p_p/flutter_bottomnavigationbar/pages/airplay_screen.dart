import 'package:flutter/material.dart';

class AirPlayScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AirPlay'),),
      body: Center(child: Text("AirPlay", style: TextStyle(color: Colors.white),),),
    );
  }
}
