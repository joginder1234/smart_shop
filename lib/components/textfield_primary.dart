import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/style_sheet.dart';

class TextFieldPrimary extends StatelessWidget {
  String hint, suffix;
  TextEditingController? controller;
  Function? onIconPressed;
  bool isObsecure;
  double padding;
  TextFieldPrimary(
      {Key? key,
      this.hint = "",
      this.controller,
      this.suffix = '',
      this.isObsecure = false,
      this.padding = 15,
      this.onIconPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObsecure,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          hintText: hint,
          hintStyle:
              GetTextTheme.sf14_Regular.copyWith(color: AppColors.hintColor),
          suffixIcon: suffix == ''
              ? null
              : IconButton(
                  onPressed:
                      onIconPressed != null ? () => onIconPressed!() : null,
                  iconSize: 18.sp,
                  icon: Image.asset(
                    suffix,
                    height: 18.h,
                  )),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: padding.h)),
    );
  }
}
