import 'dart:async';

import 'package:animation_test/utils/app_theme/text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// provides extension to get a dependency from provider
extension ContextExtension on BuildContext {
  /// allows to change field focus from one [FocusNode] to another
  void fieldFocusChange({required FocusNode from, required FocusNode to}) {
    from.unfocus();
    FocusScope.of(this).requestFocus(to);
  }

  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    unawaited(SystemChannels.textInput.invokeMethod<void>('TextInput.hide'));
    if (!currentFocus.hasPrimaryFocus) {
      FocusScope.of(this).requestFocus(FocusNode());
    }
  }

  Size get screenSize => MediaQuery.sizeOf(this);

  TextStyleTheme get textStyleTheme =>
      Theme.of(this).extension<TextStyleTheme>() ?? const TextStyleTheme();

  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
}
