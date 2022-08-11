import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/error_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/project_page_template.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/routing/routing_constants.dart';
import 'package:portfolio/extensions.dart';

// The base code for the navigator is from this tutorial:
// Tutorial link: https://medium.com/geekculture/a-simpler-guide-to-flutter-navigator-2-0-part-i-70623cedc93b
// GitHub link: https://github.com/theLee3/flutter_nav_demo
//
// Instructions on how to add other pages:
// 1. Add a new const in [RoutingConstants]
// 2. Add a new switch case with the new const in [UrlRouterDelegate._createPage()]

class UrlRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  // ================
  // Private members
  // ================

// Create a starting home page
  List<Page> _pages = [
    _createPage(const RouteSettings(name: RoutingConstants.homePageRoute))
  ];

  // ================
  // Public members
  // ================

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  List<RouteSettings>? get currentConfiguration => List.of(_pages);

  // ================
  // Singleton
  // ================

  static final UrlRouterDelegate _instance =
      UrlRouterDelegate._privateConstructor();

  factory UrlRouterDelegate() {
    return _instance;
  }

  UrlRouterDelegate._privateConstructor();

  // ================
  // Public functions
  // ================

  static void changePage(String url, {Object? arguments}) {
    url = "/$url";
    _instance._pages
        .add(_createPage(RouteSettings(name: url, arguments: arguments)));

    _instance._onChangePage();
  }

  // ==================
  // Override functions
  // ==================

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_pages.isEmpty)
          const MaterialPage(key: ValueKey("HomePage"), child: HomePage())
        else
          _pages.last
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _onChangePage();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {
    _pages.clear();
    _pages = configuration
        .map((routeSettings) => _createPage(routeSettings))
        .toList();

    if (_pages.first.name != RoutingConstants.homePageRoute) {
      _pages.insert(
          0,
          _createPage(
              const RouteSettings(name: RoutingConstants.homePageRoute)));
    }

    _onChangePage();

    return;
  }

  // ==================
  // Private functions
  // ==================

  static Page _createPage(RouteSettings routeSettings) {
    Widget child = ErrorPage(ErrorData(404, "Page not found"));

    if (routeSettings.name == null) {
      debugPrint("ERROR! routeSettings.name == null");
      child = ErrorPage(ErrorData(404, "Page not found"));
    } else {
      Uri uri = Uri.parse(routeSettings.name!);
      if (uri.pathSegments.isEmpty) {
        child = const HomePage();
      } else {
        switch (uri.pathSegments[0]) {
          // ========== Home page ==========
          case RoutingConstants.homePageRoute:
            child = const HomePage();
            break;

          // ========== Projects & ProjectTemplate page ==========
          case RoutingConstants.projectsPageRoute:
            if (uri.pathSegments.length == 1) {
              child = const ProjectsPage();
            } else if (uri.pathSegments.length == 2) {
              child = ProjectPageTemplate(
                  projectData: routeSettings.arguments! as ProjectData);
            }
            break;

          // ========== About page ==========
          case RoutingConstants.aboutRoute:
            child = const AboutPage();
            break;

          // ========== Error page ==========
          default:
            child = ErrorPage(ErrorData(404, "Page not found"));
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

  void _onChangePage() {
    Page newPage = _pages.last;

    String pageName;
    List<String> pathSegments = Uri.parse(newPage.name!).pathSegments;

    if (pathSegments.isEmpty) {
      pageName = "Home";
    } else {
      pageName = pathSegments.last;
    }

    pageName = pageName.capitalizeFirstLetter();

    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: pageName,
        primaryColor: 0xffaaaaaa,
      ),
    );

    notifyListeners();
  }
}
