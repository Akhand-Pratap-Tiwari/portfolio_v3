import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'dart:html' as html;
import '../../../../univ_constants.dart';
import '../../../../models/project.dart';
import '../../../univ_components/launch_url_func.dart';
// import 'on_hover_anim.dart';
import 'show_diag.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final bool randomGrad;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
    required this.randomGrad,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Offset normalize(Offset off, Offset max, Offset min) {
    double nx = (2 * off.dx - max.dx) / (max.dx - min.dx);
    double ny = (2 * off.dy - max.dy) / (max.dy - min.dy);
    return Offset(nx, ny);
  }

  late final Offset initialOffset;
  late ValueNotifier<Offset> pOffset;
  @override
  void initState() {
    initialOffset = widget.randomGrad
        ? Offset(Random().nextDouble() * 2 - 1, Random().nextDouble() * 2 - 1)
        : widget.index & 1 == 0
            ? const Offset(1, -1)
            : const Offset(-1, 1);
    pOffset = ValueNotifier(initialOffset);
    super.initState();
  }

  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Offset max = Offset(constraints.maxWidth, constraints.maxHeight);
        const Offset min = Offset(0, 0);
        final int descMaxLines = (constraints.maxHeight / (33 * 1.5)).floor();
        return MouseRegion(
          opaque: false,
          onEnter: (event) {
            pOffset.value = normalize(event.localPosition, max, min);
            isHovering = !isHovering;
          },
          onExit: (event) {
            pOffset.value = normalize(event.localPosition, max, min);
            isHovering = !isHovering;
          },
          onHover: (event) {
            pOffset.value = normalize(event.localPosition, max, min);
          },
          child: ValueListenableBuilder(
            valueListenable: pOffset,
            builder: (context, pOffsetValue, child) {
              return InkResponse(
                onTap: () => showMyDialog(context, widget.project),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (isHovering)
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: isHovering ? defaultBoxShadow : null,
                          borderRadius: BorderRadius.circular(defaultRadius),
                          gradient: RadialGradient(
                            focal: Alignment(pOffsetValue.dx, pOffsetValue.dy),
                            colors: [
                              Colors.cyanAccent,
                              isHovering
                                  ? Colors.blue.withOpacity(0.3)
                                  : Colors.black
                            ],
                            stops: const [0.1, 1],
                            center: Alignment(
                                pOffsetValue.dx / 2.5, pOffsetValue.dy / 2.5),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            gradient: RadialGradient(
                              focal:
                                  Alignment(pOffsetValue.dx, pOffsetValue.dy),
                              colors: const [
                                Colors.deepPurple,
                                Colors.transparent
                              ],
                              stops: const [0.01, 1],
                              center:
                                  Alignment(pOffsetValue.dx, pOffsetValue.dy),
                            ),
                          ),
                        ),
                      ),
                    child!,
                  ],
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: CardForeground(
                  project: widget.project,
                  descMaxLines: descMaxLines,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CardForeground extends StatelessWidget {
  const CardForeground({
    super.key,
    required this.descMaxLines,
    required this.project,
  });
  final Project project;
  final int descMaxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: Colors.black54,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Stack(
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
                style: TextStyle(
                    height: 1.5, color: Colors.white.withOpacity(0.95)),
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
                  onPressed: () => launchMyUrl(project.gitHubLink!),
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
                    onPressed: () => launchMyUrl(project.videoLink!),
                    icon: const FaIcon(
                      FontAwesomeIcons.circlePlay,
                      color: Colors.cyan,
                    ),
                  ),
                TextButton(
                  onPressed: () => showMyDialog(context, project),
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
    );
  }
}

// class ProjectCard extends StatelessWidget {
//   const ProjectCard({
//     Key? key,
//     // required this.maxLines,
//     required this.project,
//   }) : super(key: key);
//   // final int maxLines;
//   final Project project;
//   Future<void> _showMyDialog(context) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: true, // user must tap button!
//       builder: (BuildContext context) {
//         return BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//           child: AlertDialog(
//             backgroundColor: Colors.black.withOpacity(0.8),
//             title: Column(
//               children: [
//                 Text(project.title!),
//                 const Divider(),
//               ],
//             ),
//             content: SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 512),
//                 child: Text(
//                   project.description!,
//                   style: const TextStyle(height: 1.5),
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final int descMaxLines = (constraints.maxHeight / (33 * 1.5)).floor();
//         // debugPrint("Debug Print:  "+descMaxLines.toString());
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(defaultRadius),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//             child: Container(
//               padding: const EdgeInsets.all(defaultPadding),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(defaultRadius),
//               ),
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Container(
//                     color: Colors.red,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         project.title!,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.titleSmall,
//                       ),
//                       const Divider(),
//                       Text(
//                         project.description!,
//                         maxLines: descMaxLines,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             height: 1.5, color: Colors.white.withOpacity(0.95)),
//                         softWrap: true,
//                       ),
//                       const SizedBox(height: defaultPadding),
//                     ],
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: () => launchMyUrl(project.gitHubLink!),
//                           icon: const FaIcon(FontAwesomeIcons.github),
//                         ),
//                         if (project.videoLink != null)
//                           const SizedBox(
//                             height: 24,
//                             child: VerticalDivider(
//                               color: Colors.white,
//                             ),
//                           ),
//                         if (project.videoLink != null)
//                           IconButton(
//                             onPressed: () {},
//                             icon: const FaIcon(
//                               FontAwesomeIcons.circlePlay,
//                               color: Colors.cyan,
//                             ),
//                           ),
//                         TextButton(
//                           onPressed: () => _showMyDialog(context),
//                           child: const Text(
//                             "Read More >>",
//                             style: TextStyle(color: primaryColor),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
