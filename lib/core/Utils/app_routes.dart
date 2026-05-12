import 'package:flutter/material.dart';
import '../../features/screens/splash.dart';

class AppRoutes {
  static const String splash = '/';

  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return null;
    }
  }
}
