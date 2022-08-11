import 'package:flutter/material.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/routing/url_routing.dart';

class ProjectPreview extends StatelessWidget {
  final ProjectData project;

  static const double borderRadius = 25; // TODO: Make it more flexible to change
  static const double shadowOffset = 8; // TODO: Make it more flexible to change

  const ProjectPreview({Key? key, required this.project}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            UrlRouterDelegate.changePage("projects/${project.name}", arguments: project);
            //Navigator.push(
            //    context,
            //    MaterialPageRoute(
            //        builder: (_) => ProjectPageTemplate(projectData: project)));
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x4D000000),
                  offset: Offset(shadowOffset, shadowOffset),
                )
              ],
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius)),
              child: Image(
                  image: project.thumbnail,
                  semanticLabel: "${project.name} Thumbnail"),
            ),
          ),
        ),
        SelectableText(project.name),
      ],
    );
  }
}
