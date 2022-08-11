import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data_models/project_data.dart';
import 'package:portfolio/routing/url_routing_old.dart';

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
            // TODO: Switch pages here
            //UrlRouterDelegate.changePage("Projects/${project.name}");
            
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
