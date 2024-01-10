import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../univ_constants.dart';
import 'area_info_text.dart';
import 'my_info.dart';
import 'skills.dart';
import '../../main/components/coding.dart';
import '../../main/components/knowledges.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      text: "Uttar Pradesh, India",
                    ),
                    const AreaInfoText(
                      title: "City",
                      text: "Sitapur",
                    ),
                    const AreaInfoText(
                      title: "Age",
                      text: "20",
                    ),
                    const Skills(),
                    const SizedBox(height: defaultPadding),
                    const Coding(),
                    const Knowledges(),
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
    );
  }
}
