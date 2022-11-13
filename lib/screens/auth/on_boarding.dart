import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/bottom_nav_screen.dart';
import 'package:smart_shop/components/social_media_btn.dart';
import 'package:smart_shop/components/textfield_primary.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/auth/registeration/sign_up.dart';
import 'package:smart_shop/screens/auth/reset_password/reset_password.dart';

import '../../components/expanded_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppServices.keyboardUnfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppServices.addHeight(60.h),
                Center(
                  child: Hero(
                    tag: AppConfigs.appLogo,
                    child: Image.asset(
                      AppConfigs.appLogo,
                      scale: AppServices.scaleFactor(context),
                      width: 145.w,
                    ),
                  ),
                ),
                AppServices.addHeight(60.h),
                Text("Email/ Phone", style: GetTextTheme.sf14_Regular),
                AppServices.addHeight(15.h),
                TextFieldPrimary(
                  hint: "Enter Email Id or Mobile Number",
                ),
                AppServices.addHeight(22.h),
                Text("Password", style: GetTextTheme.sf14_Regular),
                AppServices.addHeight(15.h),
                TextFieldPrimary(
                  hint: "Enter Your Password",
                  suffix: isObsecure ? AppIcons.eyeIcon : AppIcons.eyeCloseIcon,
                  isObsecure: isObsecure,
                  onIconPressed: () => setState(() => isObsecure = !isObsecure),
                ),
                AppServices.addHeight(20.h),
                Row(
                  children: [
                    ExpandedButtonWidget(
                        text: "Sign In",
                        ontap: () =>
                            AppServices.pushTo(context, BottomNavScreenView())),
                  ],
                ),
                AppServices.addHeight(15.h),
                Center(child: Text("OR", style: GetTextTheme.sf12_Regular)),
                AppServices.addHeight(15.h),
                Row(
                  children: [
                    ExpandedButtonWidget(
                        text: "Request OTP",
                        bgColor: AppColors.btnActiveSeconday,
                        ontap: () =>
                            AppServices.pushTo(context, ResetPasswordView())),
                  ],
                ),
                AppServices.addHeight(15.h),
                Center(
                    child: Text("Or Continue With",
                        style: GetTextTheme.sf12_Regular)),
                AppServices.addHeight(7.h),
                SocialMediaButtons(),
                AppServices.addHeight(15.h),
                Center(
                    child: Text("New to Smart Shop3b?",
                        style: GetTextTheme.sf14_Regular)),
                AppServices.addHeight(25.h),
                Row(
                  children: [
                    ExpandedButtonWidget(
                        text: "Create an Account",
                        ontap: () =>
                            AppServices.pushTo(context, SignUpFormView()))
                  ],
                ),
                AppServices.addHeight(20.h)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
