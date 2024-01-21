import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_v3/univ_components/quick_links_bar.dart';
import '../responsive.dart';
import '../univ_constants.dart';
import './highlights/highlights.dart';
import './home_banner/home_banner.dart';
import './projects/my_projects.dart';
import './side_menu/side_menu.dart';
import 'certifications/certifications.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String s = Responsive.isDesktop(context)
    //     ? "Desktop"
    //     : Responsive.isMobile(context)
    //         ? "Mobile"
    //         : Responsive.isMobileLarge(context)
    //             ? "Mobile Large"
    //             : "Tablet";
    // var w = MediaQuery.of(context).size.toString();
    // debugPrint("Debug: $w");
    return SafeArea(
      child: Scaffold(
        floatingActionButton:
            Responsive.isMobile(context) || Responsive.isMobileLarge(context)
                ? Padding(
                    padding: const EdgeInsets.all(defaultPadding - 8.0),
                    child: QuickLinksBar(
                      vertical: false,
                      bgColor: Colors.blue.shade900,
                      separatorOn: true,
                    ),
                  )
                : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.black.withOpacity(0.92),
        appBar: Responsive.isDesktop(context)
            ? null
            : AppBar(
                centerTitle: true,
                backgroundColor: bgColor,
                title: const Text("My Portfolio"),
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
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 0, 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            child: const SideMenu(),
                          ),
                        ),
                      ),
                    // const SizedBox(width: defaultPadding),
                    Expanded(
                      flex: 7,
                      child: SingleChildScrollView(
                        // controller: context.scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Column(
                            children: [
                              Responsive.isMobile(context)
                                  ? const SizedBox(
                                      height: 245, child: HomeBanner())
                                  : const HomeBanner(),
                              const HighLightsInfo(),
                              const MyProjects(),
                              const SizedBox(height: 16),
                              const Certifications(),
                              if (Responsive.isMobile(context))
                                const SizedBox(height: defaultPadding * 2)
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
