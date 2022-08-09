import 'package:flutter/material.dart';
import 'package:portfolio/routing/url_routing.dart';

class PortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String pageName;

  const PortfolioAppBar({Key? key, required this.appBar, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: 
      FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          pageName,
        ),
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      actions: [
        OutlinedButton(
          child: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          // ignore: avoid_print
          onPressed: () => UrlRouterDelegate.changePage("/"),
        ),
        
        OutlinedButton(
          child: const Text("Projects",
            style: TextStyle(color: Colors.white),),
          onPressed: () => UrlRouterDelegate.changePage("/projects"),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
