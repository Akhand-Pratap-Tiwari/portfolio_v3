import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;
import '../../../../univ_constants.dart';
import '../../../../models/project.dart';
import '../../../../responsive.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    // required this.maxLines,
    required this.project,
  }) : super(key: key);
  // final int maxLines;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int descMaxLines = (constraints.maxHeight / (33*1.5)).floor();
        // debugPrint("Debug Print:  "+descMaxLines.toString());
        return ClipRRect(
          borderRadius: BorderRadius.circular(defaultRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              color: Colors.black.withOpacity(0.6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      project.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Divider(),
                    Text(
                      project.description!,
                      maxLines: descMaxLines,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(height: 1.5),
                      softWrap: true,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          html.window.open(project.gitHubLink!, 'new tab');
                        },
                        icon: FaIcon(FontAwesomeIcons.github),
                      ),
                      const SizedBox(
                        height: 24,
                        child: VerticalDivider(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.circlePlay,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                ),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text(
                //     "Read More >>",
                //     style: TextStyle(color: primaryColor),
                //   ),
                // ),
              ],
            ),
                ),
          ),
        );
      },
    );
  }
}
