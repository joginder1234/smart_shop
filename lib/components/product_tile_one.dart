import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/base_getters.dart';
import '../helpers/icons_and_image.dart';
import '../helpers/style_sheet.dart';

class ProductTile extends StatelessWidget {
  String imageUrl, productName, basicPrice, oldPrice;
  bool centertitle;
  ProductTile(
      {Key? key,
      required this.imageUrl,
      required this.productName,
      required this.basicPrice,
      this.centertitle = false,
      this.oldPrice = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(7.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(imageUrl,
                    scale: AppServices.scaleFactor(context),
                    height: AppServices.isSmallScreen(context) ? 110.h : 70.h)),
            Row(
              mainAxisAlignment: centertitle
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Text(productName,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: AppServices.scaleFactor(context),
                    style: AppServices.isSmallScreen(context)
                        ? GetTextTheme.sf14_Bold
                        : GetTextTheme.sf12_Bold),
              ],
            ),
            basicPrice == ""
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(oldPrice,
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: AppServices.scaleFactor(context),
                          style: (AppServices.isSmallScreen(context)
                                  ? GetTextTheme.sf12_Regular
                                  : GetTextTheme.sf10_regular)
                              .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.textLightColor)),
                      Text(basicPrice,
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: AppServices.scaleFactor(context),
                          style: AppServices.isSmallScreen(context)
                              ? GetTextTheme.sf12_Bold
                              : GetTextTheme.sf12_Bold),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
