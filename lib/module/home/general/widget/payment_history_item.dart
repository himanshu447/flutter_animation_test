import 'package:animation_test/model/payment_history_dm.dart';
import 'package:animation_test/utils/constants/string_constants.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/utils/extension/num_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentHistoryItem extends StatelessWidget {
  const PaymentHistoryItem({required this.paymentHistoryDm, super.key});

  final PaymentHistoryDm paymentHistoryDm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.blackColor3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.colorWhite,
            child: paymentHistoryDm.svgImage,
          ),
          16.horizontalSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paymentHistoryDm.title,
                  style: context.textStyleTheme.mediumM4,
                ),
                if (paymentHistoryDm.subtitle != null) ...[
                  2.verticalSpacing,
                  Text(
                    paymentHistoryDm.subtitle ?? '',
                    style: context.textStyleTheme.regularR5,
                  ),
                ],
              ],
            ),
          ),
          Text(
            '- \$ ${paymentHistoryDm.amount}',
            style: context.textStyleTheme.mediumM5.copyWith(
              fontFamily: StringConstant.unbounded,
            ),
          ),
        ],
      ),
    );
  }
}
