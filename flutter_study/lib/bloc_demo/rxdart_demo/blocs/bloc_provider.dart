import 'package:flutter/material.dart';
import 'package:flutter_study/bloc_demo/rxdart_demo/blocs/count_bloc.dart';

class BlocProvider extends InheritedWidget {
  CountBLoC bLoC = CountBLoC();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CountBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;
}
