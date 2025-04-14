import 'package:animation_test/module/home/my_subs/widget/select_subscription_item.dart';
import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/utils/extension/num_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:animation_test/values/app_string.dart';
import 'package:animation_test/widget/app_button.dart';
import 'package:animation_test/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_category_controller.dart';

class AddCategorySheet extends StatefulWidget {
  const AddCategorySheet({super.key});

  Future<T?> show<T extends Object>({
    required BuildContext context,
    bool isDismissible = true,
    bool enableDrag = true,
    BoxConstraints? constraints,
  }) async {
    return showModalBottomSheet<T?>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: AppColors.blackColor4,
      clipBehavior: Clip.none,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder:
          (_) => ChangeNotifierProvider(
            create: (context) => AddCategoryController(),
            child: this,
          ),
    );
  }

  @override
  State<AddCategorySheet> createState() => _AddCategorySheetState();
}

class _AddCategorySheetState extends State<AddCategorySheet> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddCategoryController>(context);

    return FractionallySizedBox(
      heightFactor: 0.95,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppString.addCategory,
              style: context.textStyleTheme.mediumM2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            30.verticalSpacing,
            Text(AppString.enterName, style: context.textStyleTheme.mediumM5),
            12.verticalSpacing,
            AppTextFormField(controller: nameController),
            24.verticalSpacing,
            Text(
              AppString.selectSubscriptions,
              style: context.textStyleTheme.mediumM2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.allSubscriptions.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (_, index) {
                  final item = controller.allSubscriptions[index];
                  return SelectSubscriptionItem(
                    subscriptionDm: item,
                    onTap: () {
                      controller.updateSubscription(item);
                    },
                  );
                },
              ),
            ),
            AppButton(
              buttonText: AppString.save,
              isActive: controller.isUserSelectedAnySubscription,
              onPressed: () async {
                await controller.storeData(nameController.text.trim());
                Navigator.pop(context);
              },
            ),
            20.verticalSpacing,
          ],
        ),
      ),
    );
  }
}
