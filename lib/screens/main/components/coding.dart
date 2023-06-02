import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../univ_components/animated_progress_indicator.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.7,
          label: "Dart",
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.68,
          label: "Python",
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.9,
          label: "C/C++",
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "Python",
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.58,
          label: "MySQL",
        ),
      ],
    );
  }
}
