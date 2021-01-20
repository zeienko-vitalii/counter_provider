import 'package:counter_provider/utils/navigation/routes.dart';
import 'package:flutter/material.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery items',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
