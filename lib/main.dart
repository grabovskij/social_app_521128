import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social/configuration/navigation/app_router_widget.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  runZonedGuarded(
    () {
      setPathUrlStrategy();
      runApp(const MyApp());
    },
    (error, stackTrace) {
      print(error);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRouterWidget();
  }
}
