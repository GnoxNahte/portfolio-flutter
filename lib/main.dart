import 'package:flutter/material.dart';
import 'package:portfolio/routing/router.dart';
import 'package:portfolio/routing/routing_constants.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home Page',
        theme: _theme(),
        onGenerateRoute: generateRoute,
        initialRoute: projectsPageRoute,
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
