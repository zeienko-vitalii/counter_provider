import 'package:counter_provider/presentation/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _materialRouteToScreen(const MainScreen());
  }

  static Route<dynamic> _materialRouteToScreen(Widget screen, [RouteSettings settings]) => MaterialPageRoute<dynamic>(
        builder: (_) => screen,
        settings: settings,
      );
}
