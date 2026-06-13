import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../controllers/otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({super.key});
  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5
        ),
      ),
    );

    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.verifyOtp
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightBg,
                borderRadius: BorderRadius.circular(20),
                border: BoxBorder.all(
                  width: 0.1,
                  color: AppColors.grey
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Row(
                    children: [
        
                      CircleAvatar(
                        backgroundColor: AppColors.lightBg1,
                        child: Icon(
                          Icons.phone_outlined,
                          size: 20,
                          color: AppColors.blue,
                        ),
                      ),
        
                      10.width,
        
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
        
                          Text(
                            AppStrings.otpSentSuccessfully,
                            style: AppTextStyle.black16SemiBold,
                          ),
        
                          Text(
                            "+91 ${controller.mobileNumber.value}",
                            style: AppTextStyle.primary12Medium.copyWith(
                                letterSpacing: 1,
                                color: AppColors.blue
                            ),
                          )
        
                        ],
                      )
        
                    ],
                  ),
        
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: AppColors.green,
                  )
        
                ],
              ),
            ),
        
            Image.asset(
              AppAssets.otpLogo,
              height: 150,
            ),
        
            Text(
              AppStrings.enterOtp,
              style: AppTextStyle.black18SemiBold,
              textAlign: TextAlign.center,
            ),
        
            Text(
              AppStrings.enterThe6DigitCode,
              style: AppTextStyle.greay13Regular,
              textAlign: TextAlign.center,
            ),
        
            20.height,
        
            Pinput(
              controller: controller.pinInputController.value,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.blue,
                    width: 0.5,
                  ),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: AppColors.lightBg1,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.blue,
                    width: 0.5
                  ),
                ),
              ),
        
              onCompleted: (pin) {

                print("OTP : $pin");

              },
              onChanged: (value) {

                if(value.length==6){

                  controller.isDisable.value = true;

                }else{

                  controller.isDisable.value = false;

                }

              },
            ),
        
            20.height,
        
            Obx(() =>controller.secondsRemaining.value==0?
            SizedBox():
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  Icons.watch_later_outlined,
                  size: 15,
                  color: Colors.grey,
                ),

                5.width,

                Text(
                  AppStrings.resendOtpIn,
                  style: AppTextStyle.greay13Regular,
                ),

                5.width,

                Text(
                  controller.formattedTime,
                  style: AppTextStyle.primary14SemiBold.copyWith(
                    color: AppColors.blue
                  ),
                ),

              ],
            ),),
        
            20.height,
        
            Obx(() => CommonButton(
              onTap: () => controller.verifyOtp(
                  mobile: controller.mobileNumber.value,
                  otp: controller.pinInputController.value.text
              ),
              text: AppStrings.verifyLogin,
              textStyle: AppTextStyle.white15SemiBold,
              color1: controller.isDisable.value==false?AppColors.primary.withOpacity(0.4):AppColors.primary,
              color2: controller.isDisable.value==false?AppColors.blue.withOpacity(0.4):AppColors.blue,
            ),),

            20.height,

            Row(
              children: [

                Flexible(child: Divider(thickness: 0.5,)),

                15.width,

                Text("OR"),

                15.width,

                Flexible(child: Divider(thickness: 0.5,)),

              ],
            ).marginSymmetric(
              horizontal: 20
            ),

            10.height,


            Obx(()=>controller.secondsRemaining.value==0?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextButton(
                  style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(AppColors.lightBg1)
                  ),
                  onPressed: () => controller.sendOtp(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Icon(
                        Icons.sync_outlined,
                        color: AppColors.blue,
                      ),

                      5.width,

                      Text(
                        AppStrings.resendOtp,
                        style: AppTextStyle.primary16Medium.copyWith(
                            color: AppColors.blue
                        ),
                      )

                    ],
                  ),
                ),

              ],
            ):SizedBox(),),

            20.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  Icons.security_outlined,
                  color: AppColors.blue,
                ),

                10.width,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      AppStrings.yourDataIs100PercentageSecure,
                      style: AppTextStyle.greyDark12Medium,
                    ),

                    Text(
                      AppStrings.weNeverShareYourInformation,
                      style: AppTextStyle.greay10Light,
                    )

                  ],
                )

              ],
            ),

            50.height,

          ],
        ).paddingSymmetric(
          horizontal: 15
        ),
      ),
    );
  }
}
