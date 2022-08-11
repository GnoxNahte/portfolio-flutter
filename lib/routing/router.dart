import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/routing/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  
  Widget screen;

  switch (settings.name) {
    case RoutingConstants.homePageRoute:     screen = const HomePage(); break;
    case RoutingConstants.projectsPageRoute: screen = const ProjectsPageWidget(); break;
    default:
      // TODO: Implement a 'page not found' page
      debugPrint("Can't find page [${settings.name}]. Returning to home page");
      screen = const HomePage(); 
      break;
  }

  return MaterialPageRoute(builder: (context) => screen);
}