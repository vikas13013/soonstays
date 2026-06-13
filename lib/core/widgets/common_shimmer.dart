import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soonstays/core/constants/app_colors.dart';

SearchPropertyShimmer(){

  return ListView.builder(
    itemCount: 10,
    padding: EdgeInsets.only(
      top: 10
    ),
    shrinkWrap: true,
    physics: ScrollPhysics(),
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: AppColors.greyLight,
        highlightColor: AppColors.grey.withOpacity(0.3),
        enabled: true,
        child: Column(
          children: [

            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyLight,
                      width: 0.3
                  )
              ),
            ),

          ],
        ),
      );
    },);

}