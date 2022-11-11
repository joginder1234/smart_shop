import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/textfield_primary.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/screens/auth/on_boarding.dart';
import 'package:smart_shop/screens/auth/otp_view.dart';

import '../../../helpers/style_sheet.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
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
              AppServices.addHeight(60.h),
              Text("Reset Password", style: GetTextTheme.sf25_Bold),
              AppServices.addHeight(20.h),
              Text(
                  "Kindly enter the Registered email ID or Mobile number th receive the OTP to Change Password",
                  style: GetTextTheme.sf14_Regular
                      .copyWith(color: AppColors.textLightColor)),
              AppServices.addHeight(60.h),
              Text("Email/ Phone", style: GetTextTheme.sf14_Regular),
              AppServices.addHeight(15.h),
              TextFieldPrimary(hint: "Enter Email Id or Mobile Number"),
              AppServices.addHeight(80.h),
              Row(children: [
                ExpandedButtonWidget(
                    text: "Send Code",
                    ontap: () =>
                        AppServices.pushTo(context, OTPView(route: "reset")))
              ]),
              AppServices.addHeight(40.h),
              Row(children: [
                ExpandedButtonWidget(
                    text: "Back to Login",
                    ontap: () => AppServices.pushTo(context, OnBoardingView()))
              ]),
            ],
          ),
        ),
      )),
    );
  }
}
