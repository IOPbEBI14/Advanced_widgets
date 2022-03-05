import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../reducers/current_theme_reducer.dart';

final Store<ThemeData> store = Store(reducer, initialState: ThemeData.light());
