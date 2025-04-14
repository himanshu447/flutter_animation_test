import 'package:animation_test/model/home_tab_dm.dart';
import 'package:animation_test/module/home/my_subs/my_subs_page.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/utils/extension/num_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:animation_test/values/app_string.dart';
import 'package:flutter/material.dart';

import 'general/general_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final List<TabItem> _tabs = [
    TabItem(icon: Icons.home, label: AppString.general),
    TabItem(icon: Icons.settings, label: AppString.mySabs),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgBlackColor,
        leading: _wrapWidgetWithScale(
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ),
        title: _wrapWidgetWithScale(child: _buildCustomTabBar()),
        actions: [
          _wrapWidgetWithScale(
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [GeneralPage(), MySubsPage()],
      ),
    );
  }

  Widget _wrapWidgetWithScale({required Widget child}) =>
      ScaleTransition(scale: _scaleAnimation, child: child);

  Widget _buildCustomTabBar() {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.blackColor2,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_tabs.length, (index) {
            final isSelected = _tabController.index == index;

            return GestureDetector(
              onTap: () {
                _tabController.animateTo(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 16 : 12,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.blueColor : AppColors.blackColor2,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Icon(_tabs[index].icon, color: Colors.white, size: 20),
                    if (isSelected) ...[
                      8.horizontalSpacing,
                      Text(
                        _tabs[index].label,
                        style: context.textStyleTheme.mediumM4.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
