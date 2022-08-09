import 'package:flutter/material.dart';
import 'package:portfolio/routing/url_routing.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final _routerDelegate = UrlRouterDelegate();

  final _routeInformationParser = UrlRouteInformationParser();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Home Page',
        theme: _theme(),
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
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
