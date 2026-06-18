import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soonstays/core/constants/app_strings.dart';

import '../utils/common_toast.dart';

///DashBoardBackExit
class DashboardBackToExit extends StatefulWidget {
  final Widget child;

  const DashboardBackToExit({
    super.key,
    required this.child,
  });

  @override
  State<DashboardBackToExit> createState() =>
      _DashboardBackToExitState();
}

class _DashboardBackToExitState extends State<DashboardBackToExit> {
  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (
          bool didPop,
          dynamic result,
          )
      {
        if (didPop) return;

        final now = DateTime.now();

        if (_lastBackPressed == null || now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {

          _lastBackPressed = now;

          AppToast.show(
            message: AppStrings.pressBackAgainToExit,
            type: AppToastType.info,
          );

          return;
        }

        SystemNavigator.pop();

      },
      child: widget.child,
    );
  }
}
