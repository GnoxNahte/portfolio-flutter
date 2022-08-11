import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/routing/my_route_information_parser.dart';
import 'package:portfolio/routing/my_router_delegate.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
    final _routerDelegate = Get.put(MyRouterDelegate());
  final _routeInformationParser = const MyRouteInformationParser();
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Home Page',
        theme: _theme(),
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
        //routerDelegate: _routerDelegate,
        //routeInformationParser: _routeInformationParser,
        );
  }

  ThemeData _theme() {
    return ThemeData.dark();
    //return ThemeData(
    //  primarySwatch: primaryBlack,
    //  textTheme: const TextTheme(
    //      //bodyText1: TextStyle(fontSize: 18.0),
    //      //bodyText2: TextStyle(fontSize: 16.0),
    //      //button: TextStyle(fontSize: 16.0),
    //      ),
    //);
  }
}