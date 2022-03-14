import 'package:advanced_widgets/reducers/app_reducer.dart';
import 'package:advanced_widgets/ui/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'models/app_state.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Store<AppState> store = Store(
    appReducer,
    initialState: AppState.initState(),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
