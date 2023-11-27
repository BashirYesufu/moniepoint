import 'package:flutter/material.dart';
import 'package:moniepoint/utilities/route_handler.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Inter",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: RouteHandler.routes,
      initialRoute: RouteHandler.initialRoute,
      onGenerateRoute: RouteHandler.generatedRoute,
    );
  }
}
