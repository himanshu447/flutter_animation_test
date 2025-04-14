import 'package:animation_test/module/home/my_subs/my_subs_page_controller.dart';
import 'package:animation_test/module/home/my_subs/widget/add_category/add_category_sheet.dart';
import 'package:animation_test/module/home/my_subs/widget/subscription_card_item.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:animation_test/values/app_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySubsPage extends StatefulWidget {
  const MySubsPage({super.key});

  @override
  State<MySubsPage> createState() => _MySubsPageState();
}

class _MySubsPageState extends State<MySubsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..forward();
  }

  Animation<Offset> _buildSlideAnimation(int index) {
    final start = index * 0.05;
    final end = start + 0.4;
    return Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          start.clamp(0.0, 1.0),
          end.clamp(0.0, 1.0),
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MySubsPageController>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 18, left: 12),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      AppString.allSabs,
                      style: context.textStyleTheme.mediumM4.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  ...controller.storeSubscription.map(
                    (e) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor4,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        e.name,
                        style: context.textStyleTheme.mediumM4.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blackColor4,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      onPressed: () async {
                        await const AddCategorySheet().show(context: context);
                        await controller.loadStoreData();
                      },
                      icon: const Icon(Icons.add, color: AppColors.colorWhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            itemCount: controller.allSubscriptions.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final animation = _buildSlideAnimation(index);
              return Transform.translate(
                offset: Offset(0, -40.0 * index),
                child: SlideTransition(
                  position: animation,
                  child:
                      index == 0
                          ? const SubscriptionCardItem(
                            isAddNewSubscriptionCard: true,
                          )
                          : SubscriptionCardItem(
                            subscriptionDm: controller.allSubscriptions[index],
                          ),
                ),
              );
            },
          ),
        ],
      ),
    );

    /// Need to check for scroll issue
    /*return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 18, left: 12),
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  AppString.allSabs,
                  style: context.textStyleTheme.mediumM4.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              ...controller.storeSubscription.map(
                (e) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: AppColors.blackColor4,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    e.name,
                    style: context.textStyleTheme.mediumM4.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blackColor4,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  onPressed: () async {
                    await const AddCategorySheet().show(context: context);
                    await controller.loadStoreData();
                  },
                  icon: const Icon(Icons.add, color: AppColors.colorWhite),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            itemCount: controller.allSubscriptions.length,
            itemBuilder: (_, index) {
              final animation = _buildSlideAnimation(index);
              return Transform.translate(
                offset: Offset(0, -40.0 * index),
                child: SlideTransition(
                  position: animation,
                  child:
                      index == 0
                          ? const SubscriptionCardItem(
                            isAddNewSubscriptionCard: true,
                          )
                          : SubscriptionCardItem(
                            subscriptionDm: controller.allSubscriptions[index],
                          ),
                ),
              );
            },
          ),
        ),
      ],
    );*/
  }
}
