

import 'package:soonstays/core/constants/app_strings.dart';

class Validators {

  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return fieldName;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emailIsRequired;
    }
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.enterAValidEmailAdrress;
    }
    return null;
  }


  static String? phone(String? value,int? digit) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.phoneNumberIsRequired;
    }
    final phoneRegex = RegExp(r'^\d{10}$'); // 10-digit phone number
    if (!phoneRegex.hasMatch(value)) {
      return AppStrings.enterAValidPhoneNumber;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.passwordIsRequired;
    }

    if (value.length < 8) {
      return AppStrings.passwordMustBeAtLeast8Characters;
    }

    final hasUppercase = RegExp(r'[A-Z]');
    final hasLowercase = RegExp(r'[a-z]');
    final hasDigit = RegExp(r'\d');
    final hasSpecialChar = RegExp(r'[!@#\$&*~%^()_+\-=\[\]{};:"\\|,.<>\/?]');

    if (!hasUppercase.hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeast1UppercaseLetter;
    }

    if (!hasLowercase.hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeast1LowercaseLetter;
    }

    if (!hasDigit.hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneDigit;
    }

    if (!hasSpecialChar.hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneSpecialCharacter;
    }

    return null;
  }

  static String? confirmPassword(String? value, String? original) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.confirmPasswordIsRequired;
    }
    if (value != original) {
      return AppStrings.passwordDoNotMatch;
    }
    return null;
  }
}