import 'package:flutter/material.dart';
import 'package:portfolio/routing/url_routing_old.dart';

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
          // TODO: Switch pages here
          //onPressed: () => UrlRouterDelegate.changePage("/"),
          onPressed: ()=>debugPrint("Switch page to Home"),
        ),
        
        OutlinedButton(
          child: const Text("Projects",
            style: TextStyle(color: Colors.white),),
            
          // TODO: Switch pages here
          //onPressed: () => UrlRouterDelegate.changePage("/projects"),
          onPressed: ()=>debugPrint("Switch page to Projects"),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
