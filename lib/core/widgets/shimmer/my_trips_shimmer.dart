import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soonstays/core/constants/app_size.dart';

class BookingCardShimmer extends StatelessWidget {
  const BookingCardShimmer({super.key});

  Widget box({
    double? width,
    double? height,
    double radius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10,
          right: 10,
          left: 10
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: Colors.white,
            width: 1
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [

            /// TOP SECTION
            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                box(
                  width: 80,
                  height: 80,
                  radius: 10,
                ),

                10.width,

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      box(
                        width: double.infinity,
                        height: 10,
                      ),

                      10.height,

                      box(
                        width: double.infinity,
                        height: 10,
                      ),

                      10.height,

                      box(
                        width: double.infinity,
                        height: 10,
                      ),

                      10.height,
                      box(
                        width: double.infinity,
                        height: 10,
                      ),

                      10.height,
                    ],
                  ),
                ),
              ],
            ),

            10.height,

            /// DATES
            Row(
              children: [

                Expanded(
                  child: box(
                    height: 30,
                  ),
                ),

                10.width,

                Expanded(
                  child: box(
                    height: 30,
                  ),
                ),

                10.width,

                Expanded(
                  child: box(
                    height: 30,
                  ),
                ),
              ],
            ),

            10.height,

            /// STATUS + PRICE
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                box(
                  width: 60,
                  height: 25,
                  radius: 8,
                ),

                10.width,

                box(
                  width: 60,
                  height: 25,
                  radius: 8,
                ),

                const Spacer(),

                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: [
                    box(
                      width: 100,
                      height: 24,
                    ),
                  ],
                )
              ],
            ),

            10.height,

            /// BUTTON
            box(
              width: double.infinity,
              height: 40,
              radius: 10,
            ),
          ],
        ),
      ),
    );
  }
}