import 'package:flutter/material.dart';
import 'package:portfolio/portfolio_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioAppBar(appBar: AppBar(), pageName: "Home"),
      body: const Text("Home page Site"),
    //  floatingActionButton: FloatingActionButton(
    //    onPressed: () {
    //      Navigator.pushNamed(context, projectsPageRoute);
    //    },
    //  ),
    );
  }
}
