import 'package:flutter/material.dart';
import 'package:portfolio/portfolio_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioAppBar(appBar: AppBar(), pageName: "About"),
      body: Column(
        children: const [
          Text("Name: Ethan Ong"),
          Text("Title: Game Programmer"),
          Text("Short summary: "),
          Text("I'm a hardworking game programmer in Singapore who strives to keep learning and implementing new ways to make games fun. "),
          Text("Socials: "),
          SelectableText("LinkedIn: www.linkedin.com/in/ethanongsg"),
        ],
      ),
    );
  }
}
