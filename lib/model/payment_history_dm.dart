import 'package:flutter/cupertino.dart';

class PaymentHistoryDm {
  PaymentHistoryDm({
    required this.title,
    required this.amount,
    required this.svgImage,
    this.subtitle,
  });

  final String title;
  final double amount;
  final String? subtitle;
  final Widget svgImage;
}
