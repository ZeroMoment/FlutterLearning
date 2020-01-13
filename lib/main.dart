import 'package:flutter/material.dart';
import 'package:flutter_learning/model/counter_model.dart';
import 'package:flutter_learning/route/routes.dart' as mRoutes;
import 'package:flutter_learning/route/scale_route.dart';
import 'package:provider/provider.dart';

import 'model/singleton.dart';
import 'module/animation/animation_scale_page.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(Provider<int>.value(
    value: textSize,
    child: ChangeNotifierProvider.value(
      value: counter,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Learning',
      initialRoute: mRoutes.home,
      routes: mRoutes.routes,
      // ignore: missing_return
      onGenerateRoute: (settings) {
        if (settings.name == mRoutes.animationScalePage) {
          Map arguments = settings.arguments;
          return ScaleRoute(AnimationScalePage(
            testTitle: arguments["test_title"],
            testSub: arguments["test_sub"],
          ));
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return mRoutes.UnknownPage();
        });
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
//全局路由过渡动画
//          pageTransitionsTheme: PageTransitionsTheme(builders: {
//            TargetPlatform.android: GlobalTransitionRoute(),
//            TargetPlatform.iOS: GlobalTransitionRoute()
//          })
      ),
    );
  }
}
