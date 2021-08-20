import 'package:flutter/material.dart';
import 'welcome_bloc.dart';

class WelcomeProvider extends InheritedWidget {
  final WelcomeBloc bloc;

  WelcomeProvider({Key key, Widget child})
      : bloc = WelcomeBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static WelcomeBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<WelcomeProvider>()).bloc;
  }
}
