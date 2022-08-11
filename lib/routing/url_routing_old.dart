/*import 'package:flutter/material.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/pages/error_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/project_page_template.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/routing/routing_constants.dart';

class UrlRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {

  Page get _currRoutePath => _pages.last;
  List<Page> _pages; // History of pages

// Singleton
  static final UrlRouterDelegate _instance = UrlRouterDelegate._privateConstructor();
  factory UrlRouterDelegate() {
    return _instance;
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  UrlRouterDelegate._privateConstructor()
      : navigatorKey = GlobalKey<NavigatorState>(),
        _pages = [];

  @override
  List<Page> get currentConfiguration {
    return List.of(_pages);
  }

  static void changePage(String url) {
    _instance._currRoutePath.updatePath(url);
    _instance._pages.add(_instance._currRoutePath.copy());
    _instance.notifyListeners();
    debugPrint(
        "Change page to $url, currRoutePath: ${_instance._currRoutePath.path}");
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey("HomePage"),
          child: HomePage(),
        ),
        if (_currRoutePath.pathSegments.length == 1 &&
            _currRoutePath.pathSegments[0] == "projects")
          const MaterialPage(
            key: ValueKey("ProjectsPage"),
            child: ProjectsPageWidget(),
          )
        else if (_currRoutePath.errorData != null)
          MaterialPage(child: ErorrPage(_currRoutePath.errorData!))
        else if (_currRoutePath.pathSegments.length == 2 &&
            _currRoutePath.pathSegments[0] == "Projects")
          ProjectPage(
              ProjectData.getProject(projects, _currRoutePath.pathSegments[1]))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_pages.length > 1) {
          _pages.removeLast();
          _currRoutePath = _pages.last;
        } else {
          debugPrint("_pages.length <= 1, Setting it to home page");
          _currRoutePath = UrlRoutePath("/");
        }

        debugPrint("Page Popped");
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(UrlRoutePath configuration) async {
    _pages.clear();
    _currRoutePath = configuration;
    _pages.add(_currRoutePath.copy());
    debugPrint("New route Set: ${configuration.path}");

    return;
  }

  List<Route<dynamic>> _generatePages(RouteSettings settings) {
    Widget screen;

    switch (settings.name) {
      case homePageRoute:
        screen = const HomePage();
        break;
      case projectsPageRoute:
        screen = const ProjectsPageWidget();
        break;
      default:
        // TODO: Implement a 'page not found' page
        debugPrint(
            "Can't find page [${settings.name}]. Returning to home page");
        screen = const HomePage();
        break;
    }

    return [MaterialPageRoute(builder: (context) => screen)];
  }
}

class UrlRouteInformationParser extends RouteInformationParser<UrlRoutePath> {
  //@override
  //Future<UrlRoutePath> parseRouteInformation(RouteInformation routeInfo) async {
  //  final Uri uri = Uri.parse(routeInfo.location);
  //}
  @override
  Future<UrlRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return UrlRoutePath("/404");
    }
    final Uri uri = Uri.parse(routeInformation.location!);
    final numOfSegements = uri.pathSegments.length;

    if (numOfSegements == 0) {
      return UrlRoutePath("/");
    } else if (numOfSegements == 1) {
      // TOOD: Change to use dictionary then loop through it
      if (uri.path == projectsPageRoute || uri.path == aboutRoute) {
        return UrlRoutePath(uri.path);
      }
    } else if (numOfSegements == 2) {
      if (uri.pathSegments[0] == "projects" &&
          ProjectData.ifProjectExists(projects, uri.pathSegments[1])) {
        return UrlRoutePath(uri.path);
      } else {
        return UrlRoutePath("/404");
      }
    }

    return UrlRoutePath("/404");
  }

  @override
  RouteInformation? restoreRouteInformation(UrlRoutePath configuration) {
    return RouteInformation(location: configuration.path);
  }
}
*/