import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';

class CompletedOrderview extends StatefulWidget {
  const CompletedOrderview({super.key});

  @override
  State<CompletedOrderview> createState() => _CompletedOrderviewState();
}

class _CompletedOrderviewState extends State<CompletedOrderview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.bgWhite),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.watchImage, height: 75.w),
                  AppServices.addWidth(15.w),
                  Expanded(
                      child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Titan Wrist Watch",
                            style: GetTextTheme.sf16_Bold),
                        Text("Qty: 2   |   Payment: ONLINE",
                            style: GetTextTheme.sf12_Regular),
                        AppServices.addHeight(12.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.textFieldColor),
                          child:
                              Text("Completed", style: GetTextTheme.sf12_Bold),
                        ),
                        AppServices.addHeight(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${AppServices.getCurrencySymbol} 326.00",
                                style: GetTextTheme.sf16_Bold),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.black100),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r)))),
                                onPressed: () {},
                                child: Text(
                                  "View Receipt",
                                  style: GetTextTheme.sf12_Bold
                                      .copyWith(color: AppColors.bgWhite),
                                ))
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
