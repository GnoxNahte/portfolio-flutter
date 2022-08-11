import 'package:flutter/material.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/pages/error_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/routing/routing_constants.dart';

class UrlRoutePathOld {
  late List<String> pathSegments;
  late RouteSettings routeSettings;

  String path;

  ErrorData? errorData;

  UrlRoutePathOld(this.path, {Object? arguments}) {
    updatePath(path);
  }

  UrlRoutePathOld copy() {
    return UrlRoutePathOld(path, arguments: routeSettings.arguments);
  }

  void updatePath(String path, {Object? arguments}) {
    Uri uri = Uri.parse(path);
    this.path = uri.path;
    pathSegments = uri.pathSegments;
    routeSettings = RouteSettings(name: path, arguments: arguments);
  }
}

class UrlRouterDelegateOld extends RouterDelegate<UrlRoutePathOld>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<UrlRoutePathOld> {
  UrlRoutePathOld _currRoutePath;
  List<UrlRoutePathOld> _pages; // History of pages

  static final UrlRouterDelegateOld _instance =
      UrlRouterDelegateOld._privateConstructor();

  factory UrlRouterDelegateOld() {
    return _instance;
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  UrlRouterDelegateOld._privateConstructor()
      : navigatorKey = GlobalKey<NavigatorState>(),
        _currRoutePath = UrlRoutePathOld("/"),
        _pages = [];

  @override
  UrlRoutePathOld? get currentConfiguration {
    return _currRoutePath;
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
            child: ProjectsPage(),
          )
        else if (_currRoutePath.errorData != null)
          MaterialPage(child: ErrorPage(_currRoutePath.errorData!))
        //else if (_currRoutePath.pathSegments.length == 2 &&
        //    _currRoutePath.pathSegments[0] == "Projects")
        //  ProjectPage(
        //      ProjectData.getProject(projects, _currRoutePath.pathSegments[1]))
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
          _currRoutePath = UrlRoutePathOld("/");
        }

        debugPrint("Page Popped");
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(UrlRoutePathOld configuration) async {
    _pages.clear();
    _currRoutePath = configuration;
    _pages.add(_currRoutePath.copy());
    debugPrint("New route Set: ${configuration.path}");

    return;
  }

  List<Route<dynamic>> _generatePages(RouteSettings settings) {
    Widget screen;

    switch (settings.name) {
      case RoutingConstants.homePageRoute:
        screen = const HomePage();
        break;
      case RoutingConstants.projectsPageRoute:
        screen = const ProjectsPage();
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

class UrlRouteInformationParserOld extends RouteInformationParser<UrlRoutePathOld> {
  //@override
  //Future<UrlRoutePath> parseRouteInformation(RouteInformation routeInfo) async {
  //  final Uri uri = Uri.parse(routeInfo.location);
  //}
  @override
  Future<UrlRoutePathOld> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return UrlRoutePathOld("/404");
    }
    final Uri uri = Uri.parse(routeInformation.location!);
    final numOfSegements = uri.pathSegments.length;

    if (numOfSegements == 0) {
      return UrlRoutePathOld("/");
    } else if (numOfSegements == 1) {
      // TOOD: Change to use dictionary then loop through it
      if (uri.path == RoutingConstants.projectsPageRoute || uri.path == RoutingConstants.aboutRoute) {
        return UrlRoutePathOld(uri.path);
      }
    } else if (numOfSegements == 2) {
      if (uri.pathSegments[0] == "projects" &&
          ProjectData.ifProjectExists(projects, uri.pathSegments[1])) {
        return UrlRoutePathOld(uri.path);
      } else {
        return UrlRoutePathOld("/404");
      }
    }

    return UrlRoutePathOld("/404");
  }

  @override
  RouteInformation? restoreRouteInformation(UrlRoutePathOld configuration) {
    return RouteInformation(location: configuration.path);
  }
}
