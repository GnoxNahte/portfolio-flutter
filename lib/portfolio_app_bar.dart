import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/projects_page.dart';

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
          onPressed: () {
            debugPrint("Home pressed");
            Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomePage()));
          },
        ),
        
        OutlinedButton(
          child: const Text("Projects",
            style: TextStyle(color: Colors.white),),
          onPressed: () { 
            debugPrint("Projects pressed");
            Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProjectsPage()));
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
