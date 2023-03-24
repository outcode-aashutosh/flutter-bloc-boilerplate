import 'package:flutter/material.dart';
import 'package:bloc_demo/base/utils/colors.dart';
import 'text_view.dart';

Widget primaryButton(String title, Function onPressed) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.primary),
      minimumSize: MaterialStateProperty.all(const Size(100, 42)),
    ),
    child: textViewComponent(
      text: title,
      fontWeight: FontWeight.bold,
      textColor: Colors.white,
      fontSize: 14,
    ),
  );
}
