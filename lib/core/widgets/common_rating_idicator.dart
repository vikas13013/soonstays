

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:soonstays/core/constants/app_colors.dart';

CommonRatingIdicator(
    {Color?color,
     double?rating,
      int?itemCount,
      double?Size
    }
    ) {

  return RatingBarIndicator(
    rating: rating??4,
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: color??Colors.amber,
    ),
    unratedColor: AppColors.greyLight,
    itemCount: itemCount??5,
    itemSize: Size??15.0,
    direction: Axis.horizontal,
  );

}