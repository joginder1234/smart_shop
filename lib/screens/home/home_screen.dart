import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/app_config.dart';
import 'package:smart_shop/bottom_nav_screen.dart';
import 'package:smart_shop/components/basic_assets.dart';
import 'package:smart_shop/components/product_tile_one.dart';
import 'package:smart_shop/components/textfield_primary.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/products/catalog_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ScreenHeaderOne(),
          AppServices.addHeight(10.h),
          ScreenHeaderTwo(),
          Expanded(
              child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        category_section(context),
                        AppServices.addHeight(10.h)
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: BannerSliderView()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppServices.addHeight(15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Premium Watches",
                                style: GetTextTheme.sf18_Bold),
                            TextButton(
                                onPressed: () {},
                                child: Text("See All",
                                    style: GetTextTheme.sf12_Bold))
                          ],
                        ),
                        GridView.builder(
                            itemCount: AppServices.isSmallScreen(context)
                                ? 4
                                : 6,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        AppServices.isSmallScreen(context)
                                            ? 2
                                            : 3,
                                    mainAxisSpacing: 7.w,
                                    crossAxisSpacing: 7.w,
                                    childAspectRatio: 0.85),
                            itemBuilder: (context, i) => ProductTile(
                                  imageUrl: AppImages.watchImage,
                                  productName: "Amazfit GTR 2",
                                  basicPrice: "11,999",
                                  oldPrice: "12,999",
                                )),
                        AppServices.addHeight(15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Grocery | Up to 10% off",
                                style: GetTextTheme.sf18_Bold),
                            TextButton(
                                onPressed: () {},
                                child: Text("See All",
                                    style: GetTextTheme.sf12_Bold))
                          ],
                        ),
                        GridView.builder(
                            itemCount: AppServices.isSmallScreen(context)
                                ? 4
                                : 6,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        AppServices.isSmallScreen(context)
                                            ? 2
                                            : 3,
                                    mainAxisSpacing: 7.w,
                                    crossAxisSpacing: 7.w,
                                    childAspectRatio: 0.85),
                            itemBuilder: (context, i) => ProductTile(
                                  imageUrl: AppImages.safolaImage,
                                  productName: "Safola Oats",
                                  basicPrice: "209.00",
                                  oldPrice: "212.00",
                                )),
                        AppServices.addHeight(10.h),
                        Container(
                          width: AppServices.getScreenWidth(context),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          color: AppColors.textFieldColor,
                          child: Column(
                            children: [
                              Text(
                                  "© 2022 Copyright RAJLAKSHMI SMART FAMILY. All Rights Reserved",
                                  textAlign: TextAlign.center,
                                  style: GetTextTheme.sf12_Regular),
                              AppServices.addHeight(7.h),
                              Image.asset(AppImages.paymentStripImage)
                            ],
                          ),
                        ),
                        AppServices.addHeight(10.h),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }

  SizedBox category_section(BuildContext context) {
    return SizedBox(
      width: AppServices.getScreenWidth(context),
      height: 100.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(categories.length, (i) {
            final item = categories[i];
            return InkWell(
              onTap: () => AppServices.pushTo(context, ProductCatalogView()),
              child: Container(
                  width: 90.w,
                  height: 100.h,
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(item.image,
                          scale: AppServices.scaleFactor(context),
                          height: 65.h),
                      Text(item.title,
                          overflow: TextOverflow.ellipsis,
                          style: GetTextTheme.sf12_Bold)
                    ],
                  )),
            );
          }),
        ),
      ),
    );
  }
}

class BannerSliderView extends StatelessWidget {
  const BannerSliderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppServices.getScreenWidth(context),
      height: 150.h,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              banners.length,
              (i) => AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(banners[i]), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.r)),
                    ),
                  )),
        ),
      ),
    );
  }
}

class ScreenHeaderTwo extends StatelessWidget {
  bool autoBackButton;
  ScreenHeaderTwo({Key? key, this.autoBackButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  autoBackButton
                      ? IconButton(
                          onPressed: () => AppServices.popView(context),
                          icon: Icon(Icons.arrow_back))
                      : SizedBox(),
                  Hero(
                    tag: AppConfigs.appLogo,
                    child: Image.asset(AppConfigs.appLogo,
                        scale: AppServices.scaleFactor(context),
                        height: 42.h,
                        width: 120.w),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () => AppServices.pushAndRemove(
                          context, BottomNavScreenView(routeIndex: 3)),
                      iconSize: 18.sp,
                      icon: Image.asset(
                        AppIcons.notificationIcon,
                        scale: AppServices.scaleFactor(context),
                        height: 20.h,
                      )),
                  IconButton(
                      onPressed: () => AppServices.pushAndRemove(
                          context, BottomNavScreenView(routeIndex: 2)),
                      iconSize: 18.sp,
                      icon: Image.asset(
                        AppIcons.cartIcon,
                        scale: AppServices.scaleFactor(context),
                        height: 20.h,
                      )),
                ],
              )
            ],
          ),
          AppServices.addHeight(5.h),
          TextFieldPrimary(
            hint: "Search Product Name",
            padding: 7,
            suffix: AppIcons.searchIcon,
          ),
          AppServices.addHeight(10.h),
        ],
      ),
    );
  }
}

class ScreenHeaderOne extends StatelessWidget {
  const ScreenHeaderOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppIcons.locationIcon, height: 10.h),
                Text("Location Pincode", style: GetTextTheme.sf10_Bold)
              ],
            ),
          )),
          SizedBox(height: 18.h, child: VerticalDivider(thickness: 1.2)),
          Expanded(
              child: SizedBox(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AppIcons.truckIcon, height: 10.h),
              Text("Track Your Order", style: GetTextTheme.sf10_Bold)
            ],
          ))),
        ],
      ),
    );
  }
}
