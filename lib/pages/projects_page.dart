import 'package:flutter/material.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/portfolio_app_bar.dart';
import 'package:portfolio/widgets/project_preview.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioAppBar(appBar: AppBar(), pageName: "Projects"),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text("Projects", style: Theme.of(context).textTheme.headline3),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 750,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1920 / (1080 + 150),
              children: List.generate(projects.length, (index) {
                ProjectData project = projects[index];
                return ProjectPreview(project: project);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
