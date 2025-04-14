import 'package:animation_test/model/subscription_dm.dart';
import 'package:animation_test/utils/constants/string_constants.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/utils/helper/color_helper.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:animation_test/values/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubscriptionCardItem extends StatelessWidget {
  const SubscriptionCardItem({
    this.subscriptionDm,
    this.isAddNewSubscriptionCard = false,
    super.key,
  });

  final SubscriptionDm? subscriptionDm;
  final bool isAddNewSubscriptionCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: ColorHelper.getRandomColor(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          isAddNewSubscriptionCard && subscriptionDm == null
              ? AppString.addSubscription
              : subscriptionDm?.name ?? '',
          style: context.textStyleTheme.mediumM1,
        ),
        subtitle:
            subscriptionDm != null
                ? FractionallySizedBox(
                  widthFactor: 0.54,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ).copyWith(bottom: 2),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: '\$ ${subscriptionDm!.amount}',
                        style: context.textStyleTheme.mediumM5.copyWith(
                          fontFamily: StringConstant.unbounded,
                          color: AppColors.blackColor2,
                        ),
                        children: [
                          const TextSpan(text: ' / '),
                          TextSpan(
                            text: subscriptionDm!.type,
                            style: context.textStyleTheme.regularR3.copyWith(
                              fontFamily: StringConstant.redHatDisplayFont,
                              color: AppColors.blackColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                : const SizedBox.shrink(),
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colorWhite,
          ),
          height: 56,
          width: 56,
          child:
              isAddNewSubscriptionCard
                  ? const Icon(Icons.add)
                  : subscriptionDm != null
                  ? SvgPicture.asset(subscriptionDm!.subImage)
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
