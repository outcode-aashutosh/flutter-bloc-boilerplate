import 'package:flutter/material.dart';
import 'package:bloc_demo/base/utils/app_spacing.dart';
import 'package:bloc_demo/base/utils/colors.dart';

import 'text_view.dart';

Widget datePickerField(
  Function onTap, {
  required String placeholder,
  required String hint,
  String? errorMessage,
  required TextEditingController controller,
  required bool doValidate,
  bool isReportPicker = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textViewComponent(
        text: placeholder,
        fontWeight: FontWeight.normal,
        textColor: isReportPicker ? AppColors.primary : AppColors.textColorGrey,
        fontSize: 17,
      ),
      AppSpacing.verticalSpacing8,
      TextFormField(
        readOnly: true,
        onTap: () {
          onTap();
        },
        decoration: InputDecoration(
            hintText: hint,
            fillColor: AppColors.fieldBorderColor,
            filled: true,
            suffixIcon: const Icon(Icons.calendar_month),
            suffixIconColor: AppColors.primary,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        validator: (value) {
          if (doValidate) {
            if (value == null || value.isEmpty) {
              return errorMessage ?? '';
            }
            return null;
          } else {
            return null;
          }
        },
        controller: controller,
      ),
    ],
  );
}
