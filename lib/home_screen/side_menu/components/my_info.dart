import 'package:flutter/material.dart';

import '../../../../univ_components/deco_rotator.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        // padding: EdgeInsets.all(defaultPadding),
        // color: const Color(0xFF242430),
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 2),
            const Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 110,
                  width: 110,
                  child: DecoRotate(),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/img/Photo4.jpg"),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "Akhand Pratap Tiwari",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Text(
              "Flutter • UX/UI • AI/ML Engineer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
