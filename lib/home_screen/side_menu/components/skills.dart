import 'package:flutter/material.dart';
import 'package:portfolio_v3/models/person.dart';
import '../../../../univ_constants.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> skillList = List.generate(
      person!.technicalSkills.length,
      (index) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            person!.technicalSkills[index],
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Skills",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1 / 0.6,
          mainAxisSpacing: defaultPadding / 3,
          crossAxisSpacing: defaultPadding / 3,
          children: skillList,
        )
        // const Row(
        //   children: [
        //     Expanded(
        //       child: AnimatedCircularProgressIndicator(
        //         percentage: 0.8,
        //         label: "Flutter",
        //       ),
        //     ),
        //     SizedBox(width: defaultPadding),
        //     Expanded(
        //       child: AnimatedCircularProgressIndicator(
        //         percentage: 0.72,
        //         label: "MongoDB",
        //       ),
        //     ),
        //     SizedBox(width: defaultPadding),
        //     Expanded(
        //       child: AnimatedCircularProgressIndicator(
        //         percentage: 0.65,
        //         label: "Firebase",
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
