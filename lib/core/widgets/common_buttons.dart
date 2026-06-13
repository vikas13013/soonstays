import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';

class CommonSquareIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  final double borderRadious;

  const CommonSquareIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.orange,
    this.iconColor = Colors.white,
    this.size = 35,
    this.iconSize = 20,
    this.borderRadious = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,

      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadious),
          ),
        ),

        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}


///Common Button
class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final double height;
  final double? width;

  final double radius;

  final Color backgroundColor;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final Color? color1;

  final Color? color2;

  final Widget? value;

  const CommonButton({
    super.key,

    this.text = "",

    required this.onTap,

    this.height = 48,
    this.width,

    this.radius = 12,

    this.backgroundColor = const Color(0xff24108D),

    this.textStyle = AppTextStyle.white12SemiBold,

    this.padding,

    this.color1,

    this.color2,

    this.value
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,

      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          elevation: 0,

          padding: EdgeInsets.zero,

          minimumSize: Size.zero,

          tapTargetSize:
          MaterialTapTargetSize.shrinkWrap,

          backgroundColor: Colors.transparent,

          shadowColor: Colors.transparent,

          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(radius),
          ),
        ),

        child: Ink(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(radius),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [
                color1 ?? AppColors.primary,
                color2 ?? AppColors.blue,
              ],
            ),
          ),

          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: value??Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }

}

class CommonButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color startColor;
  final Color endColor;
  final double height;
  final double radius;
  final double fontSize;
  final TextStyle textStyle;

  const CommonButton2({
    super.key,
    required this.text,
    required this.onTap,
    required this.startColor,
    required this.endColor,
    this.height = 35,
    this.radius = 30,
    this.fontSize = 15,
    this.textStyle = AppTextStyle.white12SemiBold,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Container(
        height: height,
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 15
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              startColor,
              endColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: startColor.withOpacity(0.30),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTextStyle.white12SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}

class CommonIconTextButton extends StatelessWidget {

  final String text;

  final VoidCallback onTap;

  final double height;

  final double? width;

  final double radius;

  final Color backgroundColor;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final Color? color1;

  final Color? color2;

  final Widget? value;

  final IconData? icon;

  final double? iconSize;

  final Color? iconColor;

  const CommonIconTextButton({
    super.key,

    this.text = "",

    required this.onTap,

    this.height = 48,

    this.width,

    this.radius = 12,

    this.backgroundColor = const Color(0xff24108D),

    this.textStyle = AppTextStyle.white12SemiBold,

    this.padding,

    this.color1,

    this.color2,

    this.value,

    this.icon,

    this.iconSize,

    this.iconColor,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,

      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          elevation: 0,

          padding: EdgeInsets.zero,

          minimumSize: Size.zero,

          tapTargetSize:
          MaterialTapTargetSize.shrinkWrap,

          backgroundColor: Colors.transparent,

          shadowColor: Colors.transparent,

          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(radius),
          ),
        ),

        child: Ink(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(radius),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [
                color1 ?? AppColors.primary,
                color2 ?? AppColors.blue,
              ],
            ),
          ),

          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                icon==null?
                SizedBox():
                Icon(
                  icon,
                  size: iconSize??15,
                  color: iconColor??AppColors.white,
                ).marginOnly(
                  right: 10
                ),

                value ??
                Text(
                  text,
                  style: textStyle,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}

class CommonImgTextButton extends StatelessWidget {

  final String text;

  final VoidCallback onTap;

  final double height;

  final double? width;

  final double radius;

  final Color backgroundColor;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final Color? color1;

  final Color? color2;

  final Widget? value;

  final String? img;

  final double? imgSize;

  final Color? borderColor;

  const CommonImgTextButton({
    super.key,

    this.text = "",

    required this.onTap,

    this.height = 48,

    this.width,

    this.radius = 12,

    this.backgroundColor = const Color(0xff24108D),

    this.textStyle = AppTextStyle.white12SemiBold,

    this.padding,

    this.color1,

    this.color2,

    this.value,

    this.img,

    this.imgSize,

    this.borderColor,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,

      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          elevation: 0,

          padding: EdgeInsets.zero,

          minimumSize: Size.zero,

          tapTargetSize:
          MaterialTapTargetSize.shrinkWrap,

          backgroundColor: Colors.transparent,

          shadowColor: Colors.transparent,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),

        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: BoxBorder.all(
              color: borderColor??AppColors.blue,
              width: 0.6
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [
                color1 ?? AppColors.primary,
                color2 ?? AppColors.blue,
              ],
            ),
          ),

          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                img==null?
                SizedBox():
                Image.asset(
                  img!,
                  height: imgSize,
                  width: imgSize,
                ).marginOnly(
                    right: 10
                ),

                value ??
                    Text(
                      text,
                      style: textStyle,
                    ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}