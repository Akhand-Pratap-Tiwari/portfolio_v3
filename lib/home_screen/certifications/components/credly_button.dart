import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../../models/person.dart';
import '../../../univ_components/launch_url_func.dart';
import '../../../univ_constants.dart';

class CredlyButton extends StatelessWidget {
  const CredlyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 802 + defaultPadding,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: defaultBoxShadow,
          gradient: const LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.teal],
            stops: [0.25, 0.75],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: IconButton.outlined(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
          ),
          hoverColor: Colors.indigo,
          color: Colors.teal,
          onPressed: () => launchMyUrl(person!.quickLinks["credly"]),
          icon: const FaIcon(
            SimpleIcons.credly,
            color: Colors.deepOrange,
            size: 75,
          ),
        ),
      ),
    );
  }
}
