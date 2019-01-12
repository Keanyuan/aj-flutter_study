import 'package:flutter/material.dart';
import 'package:flutter_study/bloc_demo/rxdart_demo/blocs/bloc_provider.dart';
import 'package:flutter_study/bloc_demo/rxdart_demo/under_page.dart';

/**
 * rxdart 入口
 */
class RxdartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'rxdart',
        theme: ThemeData.dark(),
        home: RxdartDemoC(),
      ),
    );
  }
}

class RxdartDemoC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: bloc.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${snapshot.data} times',
                style: Theme.of(context).textTheme.display1,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UnderPage()))),
    );
  }
}
