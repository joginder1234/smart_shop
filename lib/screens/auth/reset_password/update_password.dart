import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';

import '../../../app_config.dart';
import '../../../components/textfield_primary.dart';
import '../../../helpers/base_getters.dart';
import '../../../helpers/style_sheet.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Hero(
                tag: AppConfigs.appLogo,
                child: Image.asset(AppConfigs.appLogo,
                    scale: AppServices.scaleFactor(context), width: 145.w),
              )),
              AppServices.addHeight(20.h),
              Text("Update Password", style: GetTextTheme.sf25_Bold),
              AppServices.addHeight(20.h),
              Text("Kindly enter the new password ",
                  style: GetTextTheme.sf14_Regular
                      .copyWith(color: AppColors.textLightColor)),
              AppServices.addHeight(90.h),
              Text("New Password", style: GetTextTheme.sf14_Regular),
              AppServices.addHeight(15.h),
              TextFieldPrimary(hint: "Enter new password"),
              AppServices.addHeight(10.h),
              Text("ⓘ Please enter the samele password below",
                  style: GetTextTheme.sf14_Regular
                      .copyWith(color: AppColors.textLightColor)),
              AppServices.addHeight(30.h),
              Text("Confirm New Password", style: GetTextTheme.sf14_Regular),
              AppServices.addHeight(15.h),
              TextFieldPrimary(
                hint: "********",
                suffix: isObsecure ? AppIcons.eyeIcon : AppIcons.eyeCloseIcon,
                isObsecure: isObsecure,
                onIconPressed: () => setState(() => isObsecure = !isObsecure),
              ),
              AppServices.addHeight(60.h),
              Row(
                children: [ExpandedButtonWidget(text: "Submit", ontap: () {})],
              )
            ],
          ),
        ),
      )),
    );
  }
}
