import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/style_sheet.dart';

class ExpandedButtonWidget extends StatelessWidget {
  String text;
  Color bgColor, fgColor;
  double padding;
  Function? ontap;
  ExpandedButtonWidget(
      {Key? key,
      required this.text,
      required this.ontap,
      this.bgColor = AppColors.btnActiveColor,
      this.fgColor = AppColors.bgWhite,
      this.padding = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(bgColor),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: padding.h)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)))),
            onPressed: () => ontap!(),
            child: Text(text,
                style: GetTextTheme.sf14_Bold.copyWith(color: fgColor))),
      ),
    );
  }
}
