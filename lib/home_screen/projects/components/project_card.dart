import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'dart:html' as html;
import '../../../../univ_constants.dart';
import '../../../../models/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    // required this.maxLines,
    required this.project,
  }) : super(key: key);
  // final int maxLines;
  final Project project;
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.8),
            title: Column(
              children: [
                Text(project.title!),
                const Divider(),
              ],
            ),
            content: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 512),
                child: Text(
                  project.description!,
                  style: const TextStyle(height: 1.5),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      debugPrint("Debug Print: " 'Could not launch $uri');
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int descMaxLines = (constraints.maxHeight / (33 * 1.5)).floor();
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
              child: Stack(
                fit: StackFit.expand,
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
                      const SizedBox(height: defaultPadding),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => _launchUrl(project.gitHubLink!),
                          icon: const FaIcon(FontAwesomeIcons.github),
                        ),
                        if (project.videoLink != null)
                          const SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Colors.white,
                            ),
                          ),
                        if (project.videoLink != null)
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.circlePlay,
                              color: Colors.cyan,
                            ),
                          ),
                        TextButton(
                          onPressed: () => _showMyDialog(context),
                          child: const Text(
                            "Read More >>",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
