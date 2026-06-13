

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget ShaderIcon(
    {
      required IconData icons,
      double?iconSize,
      List<Color>?colorList
    }
    ){

  return ShaderMask(

    shaderCallback: (bounds) {

      return LinearGradient(

        colors: colorList??[

          AppColors.primary3,

          Color(0xffFF5E62),

        ],

      ).createShader(bounds);
    },

    child: Icon(
      icons,
      color: AppColors.white,
      size: iconSize??20,
    ),
  );

}