import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../responsive.dart';
import '../univ_constants.dart';
import 'components/highlights/highlights.dart';
import 'components/home_banner/home_banner.dart';
import 'components/projects/my_projects.dart';
import 'components/recommendations/recommendations.dart';
import 'components/side_menu/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.92),
        appBar: Responsive.isDesktop(context)
            ? null
            : AppBar(
                backgroundColor: bgColor,
                leading: Builder(
                  builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                ),
              ),
        drawer: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: const SideMenu(),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              LottieBuilder.asset(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                "assets/anims/bg3.json",
                fit: BoxFit.cover,
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: maxWidth),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            child: const SideMenu(),
                          ),
                        ),
                      ),
                    // const SizedBox(width: defaultPadding),
                    const Expanded(
                      flex: 7,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              HomeBanner(),
                              HighLightsInfo(),
                              MyProjects(),
                              Recommendations(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
