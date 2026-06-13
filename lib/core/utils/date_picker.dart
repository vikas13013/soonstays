

import 'package:flutter/material.dart';
import 'package:soonstays/core/constants/app_colors.dart';

Future<DateTime?> pickDate({
  required BuildContext context,
  DateTime?initialDate,
  DateTime?firstDate,
  DateTime?lastDate
}) async {

  final DateTime? picked = await showDatePicker(
    context: context,
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors.primary,
          buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary
          ),
          colorScheme: const ColorScheme.light(
              primary: AppColors.primary
          ).copyWith(
              secondary: AppColors.primary
          ),
        ),
        child: child!,
      );
    },
    initialDate: initialDate??DateTime.now(), // Refer step 1
    firstDate: firstDate??DateTime(1900),
    lastDate: lastDate??DateTime(2100),
  );

  return picked;
  // print("pickedpicked$picked");
}