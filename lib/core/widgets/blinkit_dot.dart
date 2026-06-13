import 'package:flutter/material.dart';

class BlinkingDot extends StatefulWidget {
  double?size;
  Color?color;
  BlinkingDot({super.key,this.size,this.color});

  @override
  State<BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<BlinkingDot>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.3, end: 1.0).animate(controller),
      child: ScaleTransition(
        scale: Tween(begin: 0.8, end: 1.2).animate(controller),
        child: Container(
          width: widget.size??5,
          height: widget.size??5 ,
          decoration: BoxDecoration(
            color: widget.color??Color(0xff22C55E),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}