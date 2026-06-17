import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/common_toast.dart';

class DoubleBackToExit extends StatefulWidget {
  final Widget child;
  final String message;

  const DoubleBackToExit({
    super.key,
    required this.child,
    this.message = 'Press back again to exit',
  });

  @override
  State<DoubleBackToExit> createState() =>
      _DoubleBackToExitState();
}

class _DoubleBackToExitState
    extends State<DoubleBackToExit> {
  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (
          bool didPop,
          dynamic result,
          ) {
        if (didPop) return;

        final now = DateTime.now();

        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) >
                const Duration(seconds: 2)) {
          _lastBackPressed = now;

          AppToast.show(
            message: widget.message,
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