import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:soonstays/core/constants/app_colors.dart';

import '../constants/app_text_styles.dart';

Widget CommonReadMoreWidget(
{
  required String text,
  TextStyle?textStyle,
  TextStyle?moreStyle,
  TextStyle?lessStyle,
  int?trimLines
}
    ){

  return ReadMoreText(
    '${text} ',
    trimMode: TrimMode.Line,
    trimLines: trimLines??10,
    colorClickableText: AppColors.primary,
    trimCollapsedText: 'Show more',
    trimExpandedText: 'Show less',
    textAlign: TextAlign.start,
    style: textStyle??AppTextStyle.greay12Regular,
    moreStyle: moreStyle??AppTextStyle.black12SemiBold,
    lessStyle: lessStyle??AppTextStyle.black12SemiBold,
  );

}