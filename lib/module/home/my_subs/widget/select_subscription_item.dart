import 'package:animation_test/model/subscription_dm.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/utils/extension/num_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectSubscriptionItem extends StatelessWidget {
  const SelectSubscriptionItem({
    required this.onTap,
    required this.subscriptionDm,
    super.key,
  });

  final SubscriptionDm subscriptionDm;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorWhite,
              ),
              child: SvgPicture.asset(subscriptionDm.subImage),
            ),
            12.horizontalSpacing,
            Expanded(
              child: Text(
                subscriptionDm.name,
                style: context.textStyleTheme.mediumM5,
              ),
            ),
            CircleAvatar(
              radius: 14,
              backgroundColor:
                  subscriptionDm.isSelected
                      ? AppColors.blueColor
                      : AppColors.bgBlackColor,
              child:
                  subscriptionDm.isSelected
                      ? const Icon(
                        Icons.check,
                        color: AppColors.colorWhite,
                        size: 16,
                      )
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
