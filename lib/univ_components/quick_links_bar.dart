import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v3/models/person.dart';
import '../../../../univ_constants.dart';
import 'launch_url_func.dart';

class QuickLinksBar extends StatelessWidget {
  final bool vertical;
  final Color bgColor;
  final bool separatorOn;
  const QuickLinksBar(
      {this.bgColor = Colors.black,
      required this.vertical,
      this.separatorOn = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final Widget seperator = vertical
        ? const SizedBox(width: 20, child: Divider(color: Colors.white))
        : const SizedBox(
            height: 20, child: VerticalDivider(color: Colors.white));
    final List<Widget> buttonList = [
      const Spacer(),
      IconButton(
        onPressed: () => launchMyUrl(person!.quickLinks["linkedIn"]),
        icon: const FaIcon(
          FontAwesomeIcons.linkedin,
          color: Colors.blue,
        ),
      ),
      if (separatorOn) seperator,
      IconButton(
        onPressed: () => launchMyUrl(person!.quickLinks["gitHub"]),
        icon: const FaIcon(FontAwesomeIcons.github),
      ),
      if (separatorOn) seperator,
      IconButton(
        onPressed: () => launchMyUrl(person!.quickLinks["youTube"]),
        icon: const FaIcon(
          FontAwesomeIcons.youtube,
          color: Colors.red,
        ),
      ),
      if (separatorOn) seperator,
      IconButton(
        onPressed: () => launchMyUrl(person!.quickLinks["phone"]),
        icon: const FaIcon(Icons.phone),
      ),
      if (separatorOn) seperator,
      IconButton(
        onPressed: () => launchMyUrl(person!.quickLinks["email"]),
        icon: const FaIcon(Icons.mail),
      ),
      // IconButton(
      //   onPressed: () {},
      //   icon: const FaIcon(FontAwesomeIcons.instagram),
      // ),
      const Spacer(),
    ];
    return Container(
      // margin: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius / 2),
        color: bgColor,
      ),
      child: vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: buttonList,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: buttonList,
            ),
    );
  }
}
