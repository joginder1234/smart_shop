import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/screens/auth/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    getSession();
  }

  getSession() {
    Future.delayed(Duration(milliseconds: 2000),
        () => AppServices.pushTo(context, OnBoardingView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Hero(
          tag: AppConfigs.appLogo,
          child: Image.asset(AppConfigs.appLogo,
              scale: AppServices.scaleFactor(context), height: 135.h),
        ),
      ),
    );
  }
}
