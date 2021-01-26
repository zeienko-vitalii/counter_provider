import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/main_component.dart';
import 'model/counter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MainComponent(),
    );
  }
}
