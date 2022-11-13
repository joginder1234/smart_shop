import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/bottom_nav_screen.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.orderSuccess, height: 150.h),
              AppServices.addHeight(15.h),
              Text("Order Successful !", style: GetTextTheme.sf22_Bold),
              AppServices.addHeight(8.h),
              Text("You have successfully made order",
                  style: GetTextTheme.sf16_Regular),
              AppServices.addHeight(30.h),
              Row(
                children: [
                  ExpandedButtonWidget(text: "View Order", ontap: () {})
                ],
              ),
              AppServices.addHeight(10.h),
              Row(
                children: [
                  ExpandedButtonWidget(
                      text: "Continue ",
                      bgColor: AppColors.textLightColor,
                      ontap: () => AppServices.pushAndRemove(
                          context, BottomNavScreenView()))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
