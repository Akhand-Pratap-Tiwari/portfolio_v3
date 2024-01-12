import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../univ_constants.dart';
import 'components/area_info_text.dart';
import 'components/coding.dart';
import 'components/knowledges.dart';
import 'components/my_info.dart';
import 'components/skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Drawer(
        backgroundColor: Colors.deepPurple.shade900.withOpacity(0.7),
        child: SafeArea(
          child: Column(
            children: [
              const MyInfo(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      const AreaInfoText(
                        title: "Residence",
                        text: "Sitapur, Uttar Pradesh,\nIndia, 261001",
                      ),
                      const Skills(),
                      const SizedBox(height: defaultPadding),
                      const Coding(),
                      // const Knowledges(),
                      const Divider(),
                      const SizedBox(height: defaultPadding / 2),
                      TextButton(
                        onPressed: () {},
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "DOWNLOAD CV",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                              const SizedBox(width: defaultPadding / 2),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.download),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: defaultPadding),
                        color: const Color(0xFF24242E),
                        child: Row(
                          children: [
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.linkedin),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.github),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.youtube),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.instagram),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}