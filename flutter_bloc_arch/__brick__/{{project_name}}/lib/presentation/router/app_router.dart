import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:{{project_name}}/presentation.dart';

class AppRouter {
  AppRouter();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    //final args = routeSettings.arguments;

    late final Builder builder;

    switch (routeSettings.name) {
      case homeRoute:
        builder = Builder(
          builder: (_) => const HomePage(),
        );
        break;

      default:
        return null;
    }

    return CupertinoPageRoute(
      builder: (context) {
        return WillPopScope(
          child: builder,
          onWillPop: () async {
            if (Platform.isIOS) {
              return true;
            } else {
              return !Navigator.of(context).userGestureInProgress;
            }
          },
        );
      },
    );
  }
}
