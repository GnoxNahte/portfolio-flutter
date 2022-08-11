// Base is from: https://github.com/theLee3/flutter_nav_demo/blob/master/nav_demo_final/lib/router/delegate.dart
// Got the base from this tutorial: https://medium.com/geekculture/a-simpler-guide-to-flutter-navigator-2-0-part-i-70623cedc93b

import 'package:flutter/material.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/pages/error_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/project_page_template.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/routing/routing_constants.dart';

class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  final _pages = <Page>[];

  late GlobalKey<NavigatorState> _navigatorKey;

  @override
  // TODO: implement navigatorKeys
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  List<Page> get currentConfiguration => List.of(_pages);

  MyRouterDelegate()
  {
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }

    debugPrint("Trying to pop when _pages.length <= 1");
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    _setPath(configuration
        .map((routeSettings) => _createPage(routeSettings))
        .toList());
    return Future.value(null);
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;

    popRoute();
    return true;
  }

  void _setPath(List<Page> pages) {
    _pages.clear();
    _pages.addAll(pages);

    if (_pages.first.name != '/') {
      _pages.insert(0, _createPage(const RouteSettings(name: '/')));
    }
    notifyListeners();
  }

  void changePage({required String name, dynamic arguments}) {
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child = ErorrPage(ErrorData(404, "Page not found"));

    if (routeSettings.name == null) {
      debugPrint("ERROR! routeSettings.name == null");
      child = ErorrPage(ErrorData(404, "Page not found"));
    } else {
      Uri uri = Uri.parse(routeSettings.name!);
      if (uri.pathSegments.isEmpty) {
        debugPrint("ERROR! uri.pathSegments.isEmpty");
        child = const HomePage();
      } else {
        switch (uri.pathSegments[0]) {
          case RoutingConstants.homePageRoute:
            child = const HomePage();
            break;
          case RoutingConstants.projectsPageRoute:
            if (uri.pathSegments.length == 1) {
              child = const ProjectsPageWidget();
            } else if (uri.pathSegments.length == 2) {
              child = ProjectPageTemplate(
                  projectData: routeSettings.arguments! as ProjectData);
            }
            break;
          default:
            child = ErorrPage(ErrorData(404, "Page not found"));
        }
      }
    }

    return MaterialPage(
      child: child,
      key: Key(routeSettings.toString()) as LocalKey,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
    );
  }
}
