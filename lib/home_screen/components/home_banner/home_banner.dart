import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../univ_constants.dart';
import '../../../responsive.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultRadius),
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/anims/bg1.json',
                  fit: BoxFit.fill,
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(
                    color: Colors.blue.withOpacity(0.1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Discover my amazing \nArt Space!",
                        style: Responsive.isDesktop(context)
                            ? Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )
                            : Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                      if (Responsive.isMobileLarge(context))
                        const SizedBox(height: defaultPadding / 2),
                      const MyBuildAnimatedText(),
                      const SizedBox(height: defaultPadding),
                      if (!Responsive.isMobileLarge(context))
                        ElevatedButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius / 2),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding * 2,
                                vertical: defaultPadding),
                            backgroundColor: primaryColor,
                          ),
                          child: const Text(
                            "EXPLORE NOW",
                            style: TextStyle(color: darkColor),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // it applies same style to all the widgets under it
      style: Theme.of(context).textTheme.titleMedium!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context)) const FlutterCodedText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          const Text("I build "),
          Responsive.isMobile(context)
              ? const Expanded(child: AnimatedText())
              : const AnimatedText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) const FlutterCodedText(),
        ],
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);
  final textList = const [
    "Flutter apps.",
    "UX/UI.",
    "AI/ML models.",
    "apps on cloud.",
    "backend."
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        animatedTexts: List.generate(
      textList.length,
      (index) => TyperAnimatedText(
        textList[index],
        speed: const Duration(milliseconds: 60),
      ),
    ));
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "🐦 I am a birb.",
            style: TextStyle(color: primaryColor),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}
