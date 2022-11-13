import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/product_tile_one.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/home/home_screen.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int qnty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w)
            .copyWith(bottom: 20.h, top: 10.h),
        child: Row(
          children: [
            ExpandedButtonWidget(
              text: "Add to cart",
              ontap: () {},
              bgColor: AppColors.btnActiveColor,
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ScreenHeaderTwo(autoBackButton: true),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppImages.safolaImage,
                          scale: AppServices.scaleFactor(context),
                          height: 200.h,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.btnActiveColor),
                        child: Text(
                          "5.0 %",
                          style: GetTextTheme.sf16_Regular
                              .copyWith(color: AppColors.bgWhite),
                        ),
                      )
                    ]),
                    AppServices.addHeight(30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w)
                          .copyWith(bottom: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saffola Gold 5 Litre 05",
                            style: GetTextTheme.sf18_Bold,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 10.h,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                            Icons.star,
                                            size: 15,
                                            color: AppColors.btnActiveColor,
                                          )),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "5 Stars",
                                  style: GetTextTheme.sf14_Bold,
                                ),
                              )
                            ],
                          ),
                          AppServices.addHeight(20.h),
                          Row(
                            children: [
                              Text(
                                "Price : ",
                                style: GetTextTheme.sf16_Regular,
                              ),
                              AppServices.addWidth(20.w),
                              Text(
                                "${AppServices.getCurrencySymbol} 350.0",
                                style: GetTextTheme.sf16_Regular.copyWith(
                                    decoration: TextDecoration.lineThrough),
                              ),
                              AppServices.addWidth(20.w),
                              Text.rich(TextSpan(
                                  text:
                                      "${AppServices.getCurrencySymbol} 875.00",
                                  style: GetTextTheme.sf16_Bold,
                                  children: [
                                    TextSpan(
                                        text: " /Litre",
                                        style: GetTextTheme.sf10_regular)
                                  ]))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Quantity : ",
                                  style: GetTextTheme.sf16_Regular),
                              AppServices.addWidth(20.w),
                              SizedBox(
                                child: Row(
                                  children: [
                                    IconButton(
                                        splashRadius: 20,
                                        onPressed: () => qnty > 1
                                            ? setState(() => qnty--)
                                            : null,
                                        icon: const Icon(Icons.remove_circle,
                                            color: AppColors.btnActiveColor)),
                                    SizedBox(
                                        width: 20.w,
                                        child: Center(
                                            child: Text(
                                                qnty.clamp(1, 20).toString(),
                                                style:
                                                    GetTextTheme.sf12_Bold))),
                                    IconButton(
                                        splashRadius: 20,
                                        onPressed: () => qnty < 20
                                            ? setState(() => qnty++)
                                            : null,
                                        icon: const Icon(Icons.add_circle,
                                            color: AppColors.btnActiveColor)),
                                  ],
                                ),
                              ),
                              AppServices.addWidth(20.w),
                              Text(
                                "(50 available)",
                                style: GetTextTheme.sf14_Regular,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Total Price : ",
                                style: GetTextTheme.sf16_Regular,
                              ),
                              AppServices.addWidth(20.w),
                              Text(
                                "${AppServices.getCurrencySymbol} 875.00",
                                style: GetTextTheme.sf16_Bold,
                              )
                            ],
                          ),
                          AppServices.addHeight(20.h),
                          const Divider(
                            thickness: 1,
                            color: AppColors.black100,
                          ),
                          AppServices.addHeight(10.h),
                          Text(
                            "Description",
                            style: GetTextTheme.sf18_Bold,
                          ),
                          AppServices.addHeight(10.h),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in dolor at mauris Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in dolor at mauris ",
                            style: GetTextTheme.sf14_Regular,
                          ),
                          AppServices.addHeight(20.h),
                          const Divider(
                            thickness: 1,
                            color: AppColors.black100,
                          ),
                          AppServices.addHeight(10.h),
                          Text(
                            "Related products",
                            style: GetTextTheme.sf18_Bold,
                          ),
                          SizedBox(
                            width: AppServices.getScreenWidth(context),
                            height: 120.w,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) => AspectRatio(
                                      aspectRatio: 0.75,
                                      child: ProductTile(
                                          imageUrl: AppImages.watchImage,
                                          productName:
                                              "Saffola Gold 5 Litre 04",
                                          basicPrice:
                                              "${AppServices.getCurrencySymbol} 875.00"),
                                    )),
                          ),
                          AppServices.addHeight(20.h),
                          const Divider(
                            thickness: 1,
                            color: AppColors.black100,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reviews",
                                style: GetTextTheme.sf18_Bold,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View All",
                                    style: GetTextTheme.sf16_Bold.copyWith(
                                        color: AppColors.btnActiveColor),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text.rich(TextSpan(
                                      text: "4.6",
                                      style: GetTextTheme.sf18_Bold,
                                      children: [
                                        TextSpan(
                                            text: " /5",
                                            style: GetTextTheme.sf10_regular)
                                      ])),
                                  Text("86 Reviews",
                                      style: GetTextTheme.sf16_Bold)
                                ],
                              ),
                              SizedBox(
                                height: 100.h,
                                child: VerticalDivider(thickness: 1),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    children: List.generate(
                                        5,
                                        (index) => RatingBarIndicator(
                                              rating: Random()
                                                  .nextInt(5)
                                                  .toDouble(),
                                              itemBuilder: (context, index) =>
                                                  Icon(Icons.star,
                                                      color: AppColors
                                                          .btnActiveColor),
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              itemSize: 20.0,
                                              direction: Axis.horizontal,
                                            )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 1.2),
                          AppServices.addHeight(10.h),
                          ...List.generate(
                              2,
                              (index) => Container(
                                    margin: EdgeInsets.only(bottom: 5.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 25.r,
                                          backgroundImage: AssetImage(
                                              AppImages.profileImage),
                                        ),
                                        AppServices.addWidth(10.w),
                                        Expanded(
                                          child: SizedBox(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("John Doe",
                                                        style: GetTextTheme
                                                            .sf14_Bold),
                                                    Text(
                                                        DateFormat.yMMMd()
                                                            .add_jm()
                                                            .format(
                                                                DateTime.now()),
                                                        style: GetTextTheme
                                                            .sf10_Bold),
                                                  ],
                                                ),
                                                RatingBarIndicator(
                                                  rating: Random()
                                                      .nextInt(5)
                                                      .toDouble(),
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                          Icons.star,
                                                          color: AppColors
                                                              .btnActiveColor),
                                                  itemCount: 5,
                                                  itemSize: 15.0,
                                                  direction: Axis.horizontal,
                                                ),
                                                AppServices.addHeight(7.h),
                                                Text(
                                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in dolor at mauris Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                                    maxLines: 3,
                                                    style: GetTextTheme
                                                        .sf10_regular),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
