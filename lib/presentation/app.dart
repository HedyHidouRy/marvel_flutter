// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:marvel/config/fonts.dart';
import 'package:marvel/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: defaultTextTheme(context),
        appBarTheme: const AppBarTheme(color: Colors.red),
        colorScheme: ColorScheme.fromSwatch(accentColor: Colors.red),
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
