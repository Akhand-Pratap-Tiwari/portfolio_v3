import 'package:flutter/material.dart';

import '../../../univ_constants.dart';
import '../../../responsive.dart';
import '../../../univ_components/animated_counter.dart';
import 'components/highlight.dart';

class HighLightsInfo extends StatelessWidget {
  const HighLightsInfo({
    Key? key,
  }) : super(key: key);

  final List<Widget> widList1 = const [
    HighLight(
      counter: AnimatedCounter(
        value: 40,
        text: "+",
      ),
      label: "Subscribers",
    ),
    HighLight(
      counter: AnimatedCounter(
        value: 10,
        text: "+",
      ),
      label: "Videos",
    ),
  ];

  final widList2 = const [
    HighLight(
      counter: AnimatedCounter(
        value: 15,
        text: "+",
      ),
      label: "GitHub Projects",
    ),
    HighLight(
      counter: AnimatedCounter(
        value: 300,
        text: "+",
      ),
      label: "LinkedIn",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Responsive.isMobileLarge(context) || Responsive.isMobile(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widList1,
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widList2,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [...widList1, ...widList2],
            ),
    );
  }
}
