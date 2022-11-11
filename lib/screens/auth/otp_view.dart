import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/style.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:smart_shop/screens/auth/registeration/set_profile.dart';
import 'package:smart_shop/screens/auth/reset_password/update_password.dart';

class OTPView extends StatefulWidget {
  String route;
  OTPView({super.key, required this.route});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final OtpFieldController _otpCtrl = OtpFieldController();
  final TextEditingController _controller = TextEditingController();

  void getNavigation() {
    switch (widget.route) {
      case "register":
        return AppServices.pushTo(context, ProfileAndPasswordView());
      case "reset":
        return AppServices.pushTo(context, UpdatePasswordView());
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppServices.keyboardUnfocus(context),
      child: Scaffold(
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
              AppServices.addHeight(13.h),
              Text("Verification", style: GetTextTheme.sf25_Bold),
              AppServices.addHeight(20.h),
              Text("Please Enter the OTP received on the the +628*******716",
                  style: GetTextTheme.sf14_Regular
                      .copyWith(color: AppColors.textLightColor)),
              AppServices.addHeight(70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Verification Code", style: GetTextTheme.sf14_Bold),
                  TextButton(
                    onPressed: () {},
                    child: Text("Re-send Code", style: GetTextTheme.sf14_Bold),
                  )
                ],
              ),
              OTPTextField(
                controller: _otpCtrl,
                length: 4,
                width: AppServices.getScreenWidth(context),
                style: GetTextTheme.sf20_Bold,
                fieldWidth: 70.w,
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                onCompleted: (value) =>
                    setState(() => _controller.text = value),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(
                    disabledBorderColor: Colors.transparent,
                    backgroundColor: AppColors.textFieldColor,
                    focusBorderColor: Colors.transparent,
                    borderColor: Colors.transparent),
              ),
              AppServices.addHeight(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Code will expire in", style: GetTextTheme.sf14_Bold),
                  Text("03:05", style: GetTextTheme.sf14_Bold),
                ],
              ),
              AppServices.addHeight(45.h),
              Row(
                children: [
                  ExpandedButtonWidget(
                      text: "Continue", ontap: () => getNavigation())
                ],
              )
            ],
          ),
        ))),
      ),
    );
  }
}
