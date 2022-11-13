import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';

class OngoingOrderView extends StatefulWidget {
  const OngoingOrderView({super.key});

  @override
  State<OngoingOrderView> createState() => _OngoingOrderViewState();
}

class _OngoingOrderViewState extends State<OngoingOrderView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppImages.emptyOrder, height: 120.h),
          AppServices.addHeight(20.h),
          Text("You don't have an order yet", style: GetTextTheme.sf22_Bold),
          AppServices.addHeight(8.h),
          Text("You don't have an ongoing order at this time",
              style: GetTextTheme.sf14_Regular)
        ],
      ),
    ));
  }
}
