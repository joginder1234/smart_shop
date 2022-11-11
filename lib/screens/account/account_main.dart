import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/classes/basic_models.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';

import '../../helpers/style_sheet.dart';

class AccountMainview extends StatefulWidget {
  const AccountMainview({super.key});

  @override
  State<AccountMainview> createState() => _AccountMainviewState();
}

class _AccountMainviewState extends State<AccountMainview> {
  final List<AccountBtnClass> _btns = [
    AccountBtnClass(AppIcons.userIcon, "Update Profile"),
    AccountBtnClass(AppIcons.lockIcon, "Change Password"),
    AccountBtnClass(AppIcons.shoppingIcon, "My Orders"),
    AccountBtnClass(AppIcons.addressIcon, "Addresses"),
    AccountBtnClass(AppIcons.languageIcon, "Language"),
    AccountBtnClass(AppIcons.faqIcon, "FAQs"),
    AccountBtnClass(AppIcons.privacyIcon, "Privacy and Terms"),
    AccountBtnClass(AppIcons.aboutIcon, "About"),
    AccountBtnClass(AppIcons.logoutIcon, "Logout"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20.r)),
                color: AppColors.btnActiveColor),
            child: Column(
              children: [
                AppServices.addHeight(45.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                      backgroundImage: AssetImage(AppImages.profileImage),
                    ),
                    AppServices.addWidth(15.w),
                    Expanded(
                        child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jhon Doe",
                              style: GetTextTheme.sf18_Bold
                                  .copyWith(color: AppColors.bgWhite)),
                          Text("jhondoe@email.com",
                              style: GetTextTheme.sf14_Regular
                                  .copyWith(color: AppColors.bgWhite))
                        ],
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
          AppServices.addHeight(30.h),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final btn = _btns[i];
                    return Card(
                        child: ListTile(
                      leading: Image.asset(btn.icon,
                          color: AppColors.btnActiveColor, height: 18.h),
                      title: Text(btn.title, style: GetTextTheme.sf16_Regular),
                    ));
                  },
                  // separatorBuilder: (context, i) => Divider(thickness: 1.2),
                  itemCount: _btns.length),
            ),
          ),
        ],
      ),
    );
  }
}
