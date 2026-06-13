import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';

class CustomInputField extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  TextStyle? style;
  TextInputType? inputType;
  Color? fillColor;
  FormFieldValidator<String>? validator;
  bool?readOnly;
  Widget? suffixIcon;
  Icon? prefixIcon;
  bool? isPrefixImg;
  bool? obscureText;
  int? maxLines;
  String? prefixImage;
  double? borderRadious;
  Widget?Suffix;
  List<TextInputFormatter>?textInputList;
  final EdgeInsetsGeometry? contentPadding;
  CustomInputField({
    Key? key,
    required this.controller,
    this.hintText,
    this.style,
    this.inputType,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.isPrefixImg,
    this.prefixImage,
    this.maxLines,
    this.validator,
    this.readOnly,
    this.borderRadious,
    this.Suffix,
    this.textInputList,
    this.contentPadding,
    this.obscureText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      cursorErrorColor: AppColors.red,
      readOnly: readOnly ?? false,
      style: style ??
          const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
      keyboardType: inputType ?? TextInputType.text,
      inputFormatters: textInputList??null,
      maxLines: maxLines ?? 1,
      obscureText: obscureText??false,
      decoration: inputDecoration(
        context,
        contentPadding: contentPadding,
        borderRadius: borderRadious,
        hint: hintText ?? "Enter Text",
        fillColor: fillColor ?? Colors.white,
        Suffix: Suffix,
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
      validator: validator??null,
    );
  }
}

String? requiredNormalTextValidator(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return '$fieldName is required';
  }
  return null;
}

class CustomInputFieldMobile extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  TextStyle? style;
  TextInputType? inputType;
  Color? fillColor;
  bool readOnly;
  Icon? suffixIcon;
  Icon? prefixIcon;
  FormFieldValidator<String>? validator;
  bool? isPrefixImg;
  int? maxLines;
  int? digit;
  String? prefixImage;
  double? borderRadius;

  CustomInputFieldMobile({
    Key? key,
    required this.controller,
    this.hintText,
    this.style,
    this.inputType,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.isPrefixImg,
    this.prefixImage,
    this.maxLines,
    this.validator,
    this.digit,
    this.borderRadius,
    required this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      cursorColor: AppColors.primary,
      cursorErrorColor: AppColors.red,
      style: style ??
          const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
      keyboardType: inputType ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(digit??10),
      ],
      decoration: inputMobileDecoration(
        borderRadius: borderRadius,
        context,
        hint: hintText ?? "Enter Text",
        fillColor: fillColor ?? Colors.white,
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
      validator: validator??null,
    );
  }
}

class CustomInputFieldBorder extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  TextStyle? style;
  TextInputType? inputType;
  Color? fillColor;
  Color? borderColor;
  bool? validation;
  String? validationText;
  bool?readOnly;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Widget? prefix;
  Widget? suffix;
  bool? isPrefixImg;
  int? maxLines;
  String? prefixImage;
  Function()?OnTap;
  bool?obscureText;
  double?borderRadious;
  List<TextInputFormatter>?inputFormattes;
  FocusNode?focusNode;
  EdgeInsetsGeometry?contentPadding;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;

  CustomInputFieldBorder({
    Key? key,
    required this.controller,
    this.hintText,
    this.borderRadious,
    this.style,
    this.inputType,
    this.fillColor,
    this.borderColor,
    this.suffixIcon,
    this.prefixIcon,
    this.isPrefixImg,
    this.prefixImage,
    this.maxLines,
    this.validation,
    this.validationText,
    this.OnTap,
    this.readOnly,
    this.suffix,
    this.prefix,
    this.obscureText,
    this.inputFormattes,
    this.focusNode,
    this.contentPadding,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly ?? false,
      focusNode: focusNode,
      style: style ?? AppTextStyle.black14Medium,
      keyboardType: inputType ?? TextInputType.text,
      inputFormatters: inputFormattes??[],
      obscureText: obscureText??false,
      onTap: OnTap ?? (){},
      maxLines: maxLines ?? 1,
      decoration: inputBorderDecoration(
        context,
        contentPadding: contentPadding,
        hint: hintText ?? "Enter Text",
        fillColor: fillColor ?? Colors.white,
        borderRadius: borderRadious,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator??null,
    );
  }
}


InputDecoration inputDecoration(BuildContext context,
    {Widget? prefixIcon,
      String? hint,
      suffixIcon,
      Widget?Suffix,
      fillColor,
      Widget?prefix,
      double?borderRadius,
      EdgeInsetsGeometry? contentPadding,
    }) {
  return InputDecoration(
      isDense: true,
      contentPadding: contentPadding?? EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8),borderSide: BorderSide.none
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8),borderSide: BorderSide.none
      ),
      filled: true,
      fillColor:  fillColor,
      hintText: hint,
      counterText: "",
      suffix: Suffix,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefix: prefix,
      prefixIconConstraints: const BoxConstraints(maxHeight: 40,maxWidth: 50,minWidth: 30),
      suffixIconConstraints: const BoxConstraints(maxHeight: 40,maxWidth: 40,minWidth: 30),
      hintStyle:  AppTextStyle.greay12Light,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none
      )
  );
}

InputDecoration inputMobileDecoration(
    BuildContext context,
    {
      Widget? prefixIcon,
      String? hint,
      suffixIcon,
      fillColor,
      Widget?prefix,
      Widget?suffix,
      double?borderRadius,
    }) {
  return InputDecoration(
      isDense: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8),
          borderSide: BorderSide.none
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8),
          borderSide: BorderSide.none
      ),
      filled: true,
      fillColor:  fillColor,
      hintText: hint,
      counterText: "",
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefix: prefix,
      suffix: suffix,
      prefixIconConstraints: const BoxConstraints(maxHeight: 40,minHeight: 30,maxWidth: 50,minWidth: 30),
      suffixIconConstraints: const BoxConstraints(maxHeight: 40,minHeight: 30,maxWidth: 40,minWidth: 30),
      hintStyle:  AppTextStyle.greay12Light,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8),borderSide: BorderSide.none
      )
  );
}


InputDecoration inputBorderDecoration(
    BuildContext context,
    {
      Widget? prefixIcon,
      String? hint,
      suffixIcon,
      fillColor,
      Widget?prefix,
      Widget?suffix,
      double?borderRadius,
      EdgeInsetsGeometry?contentPadding,
    }) {
  return InputDecoration(
    isDense: true,
    contentPadding: contentPadding,
    filled: true,
    fillColor: fillColor,
    hintText: hint,
    hintStyle: AppTextStyle.greay12Light,
    counterText: "",
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    prefix: prefix,
    suffix: suffix,
    prefixIconConstraints: BoxConstraints(
      maxHeight: 40,
      minHeight: 30,
      maxWidth: Get.width * 0.2,
      minWidth: 30,
    ),
    suffixIconConstraints: BoxConstraints(
      maxHeight: 40,
      minHeight: 30,
      maxWidth: Get.width * 0.2,
      minWidth: 30,
    ),

    /// Normal Border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius ?? 8,
      ),
      borderSide: BorderSide(
        color: AppColors.greyLight,
        width: 0.8,
      ),
    ),

    /// Focus Border
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius ?? 8,
      ),
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 1.5,
      ),
    ),

    /// Error Border
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius ?? 8,
      ),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.2,
      ),
    ),

    /// Focus + Error Border
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius ?? 8,
      ),
      borderSide: BorderSide(
        color: Colors.red.shade700,
        width: 1.5,
      ),
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius ?? 8,
      ),
    ),
  );
}

Widget CommonSearchBar({
  required TextEditingController controller,
  Widget? SuffixIcon,
  ValueChanged<String>?onChanged,}) {
  return SizedBox(
    height: 45,
    child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.1,
                color: AppColors.grey
            ),
            borderRadius: BorderRadius.circular(60)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 0.1,
                color: AppColors.grey
            ),
            borderRadius: BorderRadius.circular(60)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.1,
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(60)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1,
                color: AppColors.grey
            ),
            borderRadius: BorderRadius.circular(60)),
        fillColor: Colors.white,
        filled: true,
        // suffixIcon: SuffixIcon,
        suffixIconConstraints:
        const BoxConstraints(maxHeight: 30, maxWidth: 40, minWidth: 30),
        suffixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search_rounded,
            size: 20,
            color: Colors.grey,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: "Search",
        hintStyle: AppTextStyle.greay14Light,
      ),
    ),
  );
}