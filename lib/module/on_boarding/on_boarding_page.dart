import 'package:animation_test/gen/assets.gen.dart';
import 'package:animation_test/module/home/home_page.dart';
import 'package:animation_test/module/on_boarding/on_boarding_page_controller.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:animation_test/values/app_string.dart';
import 'package:animation_test/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  final List<String> dm = [
    Assets.vectors.figma.path,

    Assets.vectors.playStationControllerSvgrepoCom.path,

    Assets.vectors.youtubeSvgrepoCom.path,

    Assets.vectors.instagramSvgrepoCom.path,

    Assets.vectors.spotifyColorSvgrepoCom.path,
  ];

  bool isExpand = false;
  bool isInitial = false;
  bool isStarted = false;
  bool isLoop = false;

  final int numberOfCircles = 5;

  late AnimationController _controller;
  late AnimationController _fadeAndScaleController;
  late Animation<double> _animation;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAndScaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    // Make the animation repeat continuously
    _animationController.repeat();

    setState(() => isStarted = true);

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeAndScaleController, curve: Curves.easeIn),
    )..addStatusListener((status) {
      if (status.isCompleted) {
        _controller.forward();
      }
    });

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // from bottom
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _fadeAndScaleController, curve: Curves.easeOut),
    );

    _fadeAndScaleController.forward();
  }

  double _getBottomOffset() {
    return Tween<double>(begin: 100, end: 200).evaluate(_animation);
  }

  double _getLeftOffset(int index, double width) {
    final expandedPositions = [
      width / 1.6,
      width / 1.9,
      width / 6.2,
      width / 3.6,
      width / 2.5,
    ];
    final collapsedPosition = width / 2.5;

    return isStarted
        ? Tween<double>(
          begin: collapsedPosition,
          end: expandedPositions[index],
        ).evaluate(_animation)
        : collapsedPosition;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Provider.of<OnBoardingPageController>(context);

    return Scaffold(
      backgroundColor: AppColors.bgBlackColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 110),
            Expanded(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: AnimatedBuilder(
                  animation: Listenable.merge([
                    _animation,
                    _animationController,
                  ]),
                  builder: (_, __) {
                    return SizedBox(
                      height: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          ...List.generate(dm.length, (index) {
                            return Positioned(
                              left: _getLeftOffset(index, screenWidth),
                              bottom: _getBottomOffset(),
                              child: Container(
                                height: 70,
                                width: 70,
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.colorWhite,
                                ),
                                child: SvgPicture.asset(dm[index]),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppString.onBoardingTitle,
                      textAlign: TextAlign.center,
                      style: context.textStyleTheme.headerH1.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 36,
                      ),
                    ),
                    Text(
                      AppString.onBoardingDesc,
                      textAlign: TextAlign.center,
                      style: context.textStyleTheme.mediumM3.copyWith(
                        color: Colors.white54,
                      ),
                    ),

                    const Spacer(),
                    AppButton(
                      buttonText: AppString.getStarted,
                      isActive: true,
                      onPressed: () async {
                        await controller.storeLoginData();
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to lerp between two double values
  double lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
