import 'package:animation_test/gen/assets.gen.dart';
import 'package:animation_test/module/home/general/general_page_controller.dart';
import 'package:animation_test/module/home/general/widget/payment_history_item.dart';
import 'package:animation_test/utils/constants/string_constants.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/utils/extension/num_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:animation_test/values/app_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final generalPageController = Provider.of<GeneralPageController>(context);

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.spentForJanuary,
                style: context.textStyleTheme.mediumM4,
              ),
              12.verticalSpacing,
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text:
                          '\$ ${generalPageController.totalSpent.toStringAsFixed(0)}',
                      style: context.textStyleTheme.headerH1.copyWith(
                        fontFamily: StringConstant.unbounded,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '.${generalPageController.totalSpent.toString().split('.').last}',
                          style: context.textStyleTheme.headerH1.copyWith(
                            color: Colors.white24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    margin: const EdgeInsets.only(bottom: 34, left: 22),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '+ 5%',
                      style: context.textStyleTheme.regularR4.copyWith(
                        fontFamily: StringConstant.unbounded,
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                height: 160,
                margin: const EdgeInsets.only(top: 26, bottom: 30),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.colorWhite,
                            ),
                            height: 50,
                            child: Assets.vectors.spotifyColorSvgrepoCom.svg(),
                          ),
                          const Spacer(),
                          Text(
                            'Spotify',
                            style: context.textStyleTheme.mediumM2,
                          ),
                          RichText(
                            text: TextSpan(
                              text: AppString.upcomingPayment,
                              style: context.textStyleTheme.regularR5.copyWith(
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: ' 25.1',
                                  style: context.textStyleTheme.mediumM5
                                      .copyWith(
                                        color: Colors.white,
                                        fontFamily: StringConstant.unbounded,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r'$ 8',
                          style: context.textStyleTheme.mediumM2.copyWith(
                            fontFamily: StringConstant.unbounded,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const CircleAvatar(
                            backgroundColor: AppColors.colorWhite,
                            radius: 16,
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Text(
                AppString.paymentHistory,
                style: context.textStyleTheme.mediumM1,
              ),

              _getPaymentHistoryList(generalPageController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPaymentHistoryList(GeneralPageController generalPageController) =>
      Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.blackColor2,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: generalPageController.paymentHistory.length,
          itemBuilder: (_, index) {
            return PaymentHistoryItem(
              paymentHistoryDm: generalPageController.paymentHistory[index],
            );
          },
        ),
      );
}
