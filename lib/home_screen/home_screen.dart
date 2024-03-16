import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<double> listenableScrollOffset = ValueNotifier(0.0);
  // final ValueNotifier<bool> listenableIsScrolling = ValueNotifier(false);
  final ValueNotifier<ScrollDirection> listenableScrollDirection =
      ValueNotifier(ScrollDirection.forward);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      listenableScrollOffset.value = scrollController.offset;
      // listenableIsScrolling.value =
      // scrollController.position.isScrollingNotifier.value;
      listenableScrollDirection.value =
          scrollController.position.userScrollDirection;
      // print(controller.offset); // <-- This is it.
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
        backgroundColor: Colors.black.withOpacity(0.95),
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
              ScrollingBg(
                listenableScrollOffset: listenableScrollOffset,
                // listenableIsScrolling: listenableIsScrolling,
                listenableScrollDirection: listenableScrollDirection,
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
                        controller: scrollController,
                        // physics: const BouncingScrollPhysics(),
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

class ScrollingBg extends StatefulWidget {
  final ValueNotifier<double> listenableScrollOffset;
  // final ValueNotifier<bool> listenableIsScrolling;
  final ValueNotifier<ScrollDirection> listenableScrollDirection;

  const ScrollingBg({
    required this.listenableScrollOffset,
    // required this.listenableIsScrolling,
    required this.listenableScrollDirection,
    super.key,
  });

  @override
  State<ScrollingBg> createState() => _ScrollingBgState();
}

class _ScrollingBgState extends State<ScrollingBg>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: widget.listenableScrollOffset,
      builder: (context, child) {
        if (_controller.duration != null) {
          if (widget.listenableScrollDirection.value ==
              ScrollDirection.reverse) {
            _controller.value += 0.005;
            _controller.repeat();
          } else {
            _controller.value -= 0.005;
            _controller.repeat();
          }
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            // if (child != null) child,
            Transform.translate(
              offset: Offset(
                Responsive.isMobile(context) ||
                        Responsive.isMobileLarge(context)
                    ? 0
                    : 200,
                Responsive.isDesktop(context) ? -200 : 0,
              ),
              child: LottieBuilder.asset(
                frameRate: FrameRate.max,
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration =
                        (composition.duration + const Duration(seconds: 15))
                    ..repeat();
                },
                width: size.width,
                height: size.height,
                "assets/anims/bg3.json",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(
                    (sin(widget.listenableScrollOffset.value / 300).abs())),
                backgroundBlendMode: BlendMode.color,
              ),
            ),
          ],
        );
      },
    );
  }
}
