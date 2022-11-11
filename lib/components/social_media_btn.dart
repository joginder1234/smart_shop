import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/base_getters.dart';
import '../helpers/icons_and_image.dart';

class SocialMediaButtons extends StatelessWidget {
  Function? onFBClick;
  Function? onGoogleClick;
  SocialMediaButtons({Key? key, this.onFBClick, this.onGoogleClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10.w,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          InkWell(
            onTap: () => onFBClick!(),
            child: Image.asset(
              AppIcons.fbIcon,
              scale: AppServices.scaleFactor(context),
              height: 25.h,
            ),
          ),
          InkWell(
            onTap: () => onGoogleClick!(),
            child: Image.asset(
              AppIcons.googleIcon,
              scale: AppServices.scaleFactor(context),
              height: 25.h,
            ),
          ),
        ],
      ),
    );
  }
}
