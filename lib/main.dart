import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/providers/appdata_provider.dart';
import 'package:smart_shop/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppDataProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        ),
      ),
      splitScreenMode: false,
      designSize: const Size(AppConfigs.designWidth, AppConfigs.designHeight),
    );
  }
}
