import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/textfield_primary.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.btnActiveColor,
        foregroundColor: AppColors.bgWhite,
        elevation: 0,
        centerTitle: true,
        title: Text("Edit Profile", style: GetTextTheme.sf18_Bold),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 55.sp,
                    backgroundImage: AssetImage(AppImages.profileImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.bgWhite, shape: BoxShape.circle),
                      child: Icon(Icons.add_circle,
                          size: 25.sp, color: AppColors.btnActiveColor),
                    ),
                  )
                ],
              ),
            ),
            AppServices.addHeight(35.h),
            Text("Name", style: GetTextTheme.sf12_Regular),
            AppServices.addHeight(15.h),
            TextFieldPrimary(
              hint: "Your Name",
            ),
            AppServices.addHeight(20.h),
            Text("Email", style: GetTextTheme.sf12_Regular),
            AppServices.addHeight(15.h),
            TextFieldPrimary(
              hint: "name@email.com",
            ),
            AppServices.addHeight(20.h),
            Text("Phone", style: GetTextTheme.sf12_Regular),
            AppServices.addHeight(15.h),
            TextFieldPrimary(
              hint: "+91 XXXXXXX539",
            ),
            AppServices.addHeight(45.h),
            Row(
              children: [
                ExpandedButtonWidget(text: "Save Profile", ontap: () {})
              ],
            )
          ],
        ),
      ))),
    );
  }
}
