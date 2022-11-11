import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/screens/home/home_screen.dart';

import '../../helpers/style_sheet.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
          child: Column(
        children: [
          ScreenHeaderTwo(),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, i) => ListTile(
                        leading: const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.check_circle,
                                color: AppColors.btnActiveColor)),
                        title: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc volutpat quam felis, in vestibulum nisi tincidunt sit amet.",
                            style: GetTextTheme.sf12_Bold),
                        subtitle: Text(
                            DateFormat.yMMMd().add_jm().format(DateTime.now()),
                            style: GetTextTheme.sf10_regular),
                      ),
                  separatorBuilder: (ctx, i) => const Divider(thickness: 1.2),
                  itemCount: 7),
            ),
          ),
        ],
      )),
    );
  }
}
