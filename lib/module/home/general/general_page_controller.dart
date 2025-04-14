import 'package:animation_test/gen/assets.gen.dart';
import 'package:animation_test/model/payment_history_dm.dart';
import 'package:flutter/cupertino.dart';

class GeneralPageController with ChangeNotifier {
  GeneralPageController() {
    loadHistoryData();
  }

  final List<PaymentHistoryDm> paymentHistory = [];

  double totalSpent = 0;

  void loadHistoryData() {
    paymentHistory
      ..add(
        PaymentHistoryDm(
          title: 'Figma',
          svgImage: Assets.vectors.figma.svg(),
          amount: 8.0,
          subtitle: 'Yesterday, at 5:12 PM',
        ),
      )
      ..add(
        PaymentHistoryDm(
          title: 'HBO Max',
          svgImage: Assets.vectors.hboMaxSvgrepoCom.svg(),
          amount: 9.99,
          subtitle: '20.12.2022, at 5:12 PM',
        ),
      )
      ..add(
        PaymentHistoryDm(
          title: 'PS Plus',
          svgImage: Assets.vectors.playStationControllerSvgrepoCom.svg(),
          amount: 67.57,
          subtitle: '15.12.2022, at 5:12 PM',
        ),
      )
      ..add(
        PaymentHistoryDm(
          title: 'YouTube',
          svgImage: Assets.vectors.hboMaxSvgrepoCom.svg(),
          amount: 8.97,
          subtitle: '10.12.2022, at 5:12 PM',
        ),
      )
      ..add(
        PaymentHistoryDm(
          title: 'Twitter',
          svgImage: Assets.vectors.twitterSvgrepoCom.svg(),
          amount: 30.4,
          subtitle: '15.11.2022, at 5:12 PM',
        ),
      );

    // calculate total spent
    calculateTotalSpent();

    notifyListeners();
  }

  void calculateTotalSpent() {
    for (final element in paymentHistory) {
      totalSpent = totalSpent + element.amount;
    }
  }
}
