import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';

class ProfileShimmerScreen extends StatelessWidget {
  const ProfileShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Banner Image
                Stack(
                  children: [

                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),

                    Positioned(
                      top: 16,
                      left: 16,
                      child: _circle(52),
                    ),

                    Positioned(
                      top: 16,
                      right: 16,
                      child: _circle(52),
                    ),

                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        height: 55,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                /// Title + Rating
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        children: [

                          _line(double.infinity, 18),

                          const SizedBox(height: 14),

                          _line(double.infinity, 5),

                          10.height,

                          _line(double.infinity, 5),

                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                  ],
                ).marginSymmetric(horizontal: 15),

                const SizedBox(height: 22),

                _textField(
                  iconData: Icons.person_outline_outlined
                ),

                10.height,


                _textField(
                    iconData: Icons.email_outlined
                ),

                10.height,

                _textField(
                    iconData: Icons.phone_outlined
                ),

                30.height,

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15
                  ),
                  width: Get.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _line(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _circle(double size) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _textField({required IconData iconData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: Get.width*0.3,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        6.height,

        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: BoxBorder.all(
              color: Colors.grey
            )
          ),
          child: Row(
            children: [

              Icon(iconData).marginSymmetric(
                horizontal: 10
              ),


            ],
          ),
        )


      ],
    ).marginSymmetric(
      horizontal: 15
    );
  }

}