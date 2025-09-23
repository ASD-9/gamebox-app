import 'package:flutter/material.dart';
import 'package:gamebox/home_page.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
