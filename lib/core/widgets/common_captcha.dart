import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/utils/textfield_validation.dart';

import 'common_text_field.dart';

class CommonCaptcha extends StatefulWidget {
  final TextEditingController controller;
  final Function(String captcha) onCaptchaChanged;

  const CommonCaptcha({
    super.key,
    required this.controller,
    required this.onCaptchaChanged,
  });

  @override
  State<CommonCaptcha> createState() =>
      CommonCaptchaState();
}

class CommonCaptchaState extends State<CommonCaptcha> {

  String captcha = '';

  String get currentCaptcha => captcha;

  @override
  void initState() {
    super.initState();
    generateCaptcha();
  }

  /// Public Method
  void generateCaptcha() {

    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    final random = Random();

    captcha = String.fromCharCodes(
      Iterable.generate(
        5,
            (_) => chars.codeUnitAt(
          random.nextInt(chars.length),
        ),
      ),
    );

    widget.controller.clear();

    widget.onCaptchaChanged(captcha);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        /// Captcha Box
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            strokeWidth: 1.2,
            padding: EdgeInsets.zero,
            radius: const Radius.circular(6),
            dashPattern: const [6, 4],
            color: Colors.grey.shade500,
          ),
          child: Container(
            height: 40,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius:
              BorderRadius.circular(8),
            ),
            child: Text(
              captcha,
              style: AppTextStyle.primary18SemiBold.copyWith(
                color: AppColors.blue,
                letterSpacing: 2,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        /// Refresh Button
        InkWell(
          onTap: generateCaptcha,
          borderRadius:
          BorderRadius.circular(50),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.refresh,
              size: 22,
            ),
          ),
        ),

        const SizedBox(width: 12),

        /// Input
        Expanded(
          child: CustomInputFieldBorder(
            borderColor: AppColors.black,
            controller: widget.controller,
            hintText: AppStrings.enterCode,
            validator: (value) =>
                Validators.required(
                  value,
                  AppStrings.enterCode,
                ),
          ),
        ),
      ],
    );
  }
}