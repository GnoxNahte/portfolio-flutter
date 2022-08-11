import 'package:flutter/material.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/portfolio_app_bar.dart';

class ProjectPageTemplate extends StatelessWidget {
  final ProjectData projectData;

  const ProjectPageTemplate({Key? key, required this.projectData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioAppBar(appBar: AppBar(), pageName: "Projects/${projectData.name}"),
      body: 
        Column(
          children: [
            Image(image: projectData.thumbnail),
            SelectableText(projectData.name, style: Theme.of(context).textTheme.headline3),
            SelectableText(projectData.description, style: Theme.of(context).textTheme.bodyText1),
            SelectableText("Platforms: ${projectData.platforms}"),
          ],
        ),
    );
  }
}

//class ProjectPage extends Page {
//  final ProjectData project;
//
//  ProjectPage(this.project) : super(key: ValueKey(project.name));
//
//  @override
//  Route createRoute(BuildContext context) {
//    return MaterialPageRoute(
//      settings: this,
//      builder: (BuildContext context) {
//        return ProjectPageTemplate(projectData: project);
//      },
//    );
//  }
//}