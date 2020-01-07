import 'package:flutter/material.dart';
import 'package:flutter_learning/route/routes.dart' as mRoutes;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      initialRoute: mRoutes.home,
      routes: mRoutes.routes,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {
            return mRoutes.UnknownPage();
          }
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

