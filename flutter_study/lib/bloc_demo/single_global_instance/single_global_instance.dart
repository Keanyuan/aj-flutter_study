import 'package:flutter/material.dart';
import 'package:flutter_study/bloc_demo/single_global_instance/count_bloc.dart';
import 'package:flutter_study/bloc_demo/single_global_instance/under_page.dart';


class SingleGlobalInstance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: bLoC.stream,
            initialData: bLoC.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${snapshot.data} times',
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UnderPage()))),
    );
  }
}
