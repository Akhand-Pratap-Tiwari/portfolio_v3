import 'package:flutter/material.dart';
import '../../../models/project.dart';
import '../../../responsive.dart';
import '../../../univ_constants.dart';
import 'components/project_card.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Responsive
    // int count = MediaQuery.of(context).size.width ~/ (2*230);
    //Remove debug here
    // String s = Responsive.isDesktop(context)
    //     ? "Desktop"
    //     : Responsive.isMobile(context)
    //         ? "Mobile"
    //         : Responsive.isMobileLarge(context)
    //             ? "Large Mobile"
    //             : "Tablet";
    // debugPrint("Debug Print: " + s);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Projects",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: defaultPadding),
        const Responsive(
          mobile: ProjectsGridView(
            crossAxisCount: 1,
            childAspectRatio: 2/1.3,
            // maxLines: 4,
          ),
          mobileLarge: ProjectsGridView(
            crossAxisCount: 2,
            childAspectRatio: 1,
            // maxLines: 5,
          ),
          tablet: ProjectsGridView(
            crossAxisCount: 3,
            childAspectRatio: 1,
            // maxLines: 6,
          ),
          desktop: ProjectsGridView(
            crossAxisCount: 3,
            childAspectRatio: 1/0.8,
            // maxLines: 7,
          ),
        )
      ],
    );
  }
}

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({
    Key? key,
    required this.crossAxisCount,
    required this.childAspectRatio,
    // required this.maxLines,
  }) : super(key: key);

  // final int maxLines;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      semanticChildCount: projects.length,
      childAspectRatio: childAspectRatio,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      children: List.generate(
        projects.length,
        (index) => ProjectCard(
          // maxLines: maxLines,
          index: index,
          randomGrad: false,
          project: projects[index],
        ),
      ),
    );
  }
}
