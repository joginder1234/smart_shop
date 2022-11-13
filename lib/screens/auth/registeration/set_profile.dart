import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/textfield_primary.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';

class ProfileAndPasswordView extends StatefulWidget {
  const ProfileAndPasswordView({super.key});

  @override
  State<ProfileAndPasswordView> createState() => _ProfileAndPasswordViewState();
}

class _ProfileAndPasswordViewState extends State<ProfileAndPasswordView> {
  bool isObsecure = true;
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
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Hero(
                tag: AppConfigs.appLogo,
                child: Image.asset(AppConfigs.appLogo,
                    scale: AppServices.scaleFactor(context), width: 145.w),
              )),
              AppServices.addHeight(28.h),
              Text("Profile & Password", style: GetTextTheme.sf25_Bold),
              AppServices.addHeight(20.h),
              Text(
                  "Kindly update your profile name and update the password for future",
                  style: GetTextTheme.sf14_Regular
                      .copyWith(color: AppColors.textLightColor)),
              AppServices.addHeight(50.h),
              Text("Full Name", style: GetTextTheme.sf14_Regular),
              AppServices.addHeight(15.h),
              TextFieldPrimary(hint: "Enter full name"),
              AppServices.addHeight(30.h),
              Text("Password", style: GetTextTheme.sf14_Regular),
              AppServices.addHeight(15.h),
              TextFieldPrimary(
                hint: "********",
                suffix: isObsecure ? AppIcons.eyeIcon : AppIcons.eyeCloseIcon,
                isObsecure: isObsecure,
                onIconPressed: () => setState(() => isObsecure = !isObsecure),
              ),
              AppServices.addHeight(60.h),
              Text("Referal Code (Optional)", style: GetTextTheme.sf14_Regular),
              AppServices.addHeight(15.h),
              TextFieldPrimary(hint: "Enter your code"),
              AppServices.addHeight(30.h),
              Row(
                children: [
                  ExpandedButtonWidget(text: "Continue", ontap: () {})
                ],
              ),
              AppServices.addHeight(40.h),
            ],
          ),
        ),
      )),
    );
  }
}
