import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'subscription_dm.g.dart';

@HiveType(typeId: 2)
class SubscriptionDm {
  SubscriptionDm({
    required this.name,
    required this.subImage,
    this.type,
    this.amount,
    this.isSelected = false,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String subImage;
  @HiveField(2)
  final String? type;
  @HiveField(3)
  final double? amount;
  @HiveField(4)
  final bool isSelected;

  SubscriptionDm copyWith({
    String? name,
    String? subImage,
    String? type,
    double? amount,
    bool? isSelected,
  }) {
    return SubscriptionDm(
      name: name ?? this.name,
      subImage: subImage ?? this.subImage,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
