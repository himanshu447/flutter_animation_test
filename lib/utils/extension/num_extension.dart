import 'package:flutter/material.dart';

extension AppSpacingExtension on num {
  SizedBox get horizontalSpacing => SizedBox(width: toDouble());

  SizedBox get verticalSpacing => SizedBox(height: toDouble());
}
