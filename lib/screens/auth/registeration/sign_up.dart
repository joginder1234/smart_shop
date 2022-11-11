import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/social_media_btn.dart';
import 'package:smart_shop/components/textfield_primary.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/auth/on_boarding.dart';
import 'package:smart_shop/screens/auth/otp_view.dart';

class SignUpFormView extends StatefulWidget {
  const SignUpFormView({super.key});

  @override
  State<SignUpFormView> createState() => _SignUpFormViewState();
}

class _SignUpFormViewState extends State<SignUpFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.bgWhite,
        foregroundColor: AppColors.black100,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: AppConfigs.appLogo,
                child: Image.asset(AppConfigs.appLogo,
                    scale: AppServices.scaleFactor(context), width: 145.w),
              ),
            ),
            AppServices.addHeight(20.h),
            Text("User Registration", style: GetTextTheme.sf25_Bold),
            AppServices.addHeight(20.h),
            Text(
                "Kindly enter the registered Email id or Mobile Number to login with OTP",
                style: GetTextTheme.sf14_Regular
                    .copyWith(color: AppColors.textLightColor)),
            AppServices.addHeight(35.h),
            Text("Email/ Phone", style: GetTextTheme.sf14_Regular),
            AppServices.addHeight(15.h),
            TextFieldPrimary(
              hint: "Enter Email Id or Mobile Number",
            ),
            AppServices.addHeight(60.h),
            Row(
              children: [
                ExpandedButtonWidget(
                    text: "Request OTP",
                    ontap: () =>
                        AppServices.pushTo(context, OTPView(route: "register")))
              ],
            ),
            AppServices.addHeight(60.h),
            SocialMediaButtons(),
            AppServices.addHeight(30.h),
            Text("Already have an account?", style: GetTextTheme.sf14_Regular),
            AppServices.addHeight(10.h),
            Row(
              children: [
                ExpandedButtonWidget(
                    text: "Back to Login",
                    bgColor: AppColors.btnActiveSeconday,
                    ontap: () =>
                        AppServices.pushAndRemove(context, OnBoardingView()))
              ],
            ),
          ],
        ),
      ))),
    );
  }
}
