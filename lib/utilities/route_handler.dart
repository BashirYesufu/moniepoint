import 'package:flutter/cupertino.dart';
import 'package:moniepoint/features/landing/landing_tab.dart';

import '../features/landing/tabs/home.dart';
import '../features/splash/splash.dart';

class RouteHandler {
  static String initialRoute = Splash.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    Splash.routeName: (context) => Splash(),
    LandingTab.routeName: (context) => LandingTab(),
    Home.routeName: (context) => Home(),
  };

  static Route<dynamic>? generatedRoute(RouteSettings route) {
    switch (route.name) {
      default:
        return null;
    }
  }
}