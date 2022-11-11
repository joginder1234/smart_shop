import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/product_tile_one.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
              padding:
                  EdgeInsets.symmetric(horizontal: 15.w).copyWith(bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saffola Gold 5 Litre 05",
                    style: GetTextTheme.sf18_Bold,
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
                        style: GetTextTheme.sf16_Regular
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      AppServices.addWidth(20.w),
                      Text.rich(TextSpan(
                          text: "${AppServices.getCurrencySymbol} 875.00",
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
                      Text("Quantity : ", style: GetTextTheme.sf16_Regular),
                      AppServices.addWidth(20.w),
                      SizedBox(
                        child: Row(
                          children: [
                            IconButton(
                                splashRadius: 20,
                                onPressed: () =>
                                    qnty > 1 ? setState(() => qnty--) : null,
                                icon: const Icon(Icons.remove_circle,
                                    color: AppColors.btnActiveColor)),
                            SizedBox(
                                width: 20.w,
                                child: Center(
                                    child: Text(qnty.clamp(1, 20).toString(),
                                        style: GetTextTheme.sf12_Bold))),
                            IconButton(
                                splashRadius: 20,
                                onPressed: () =>
                                    qnty < 20 ? setState(() => qnty++) : null,
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
                    height: 200.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => AspectRatio(
                              aspectRatio: 0.75,
                              child: ProductTile(
                                  imageUrl: AppImages.watchImage,
                                  productName: "Saffola Gold 5 Litre 04",
                                  basicPrice:
                                      "${AppServices.getCurrencySymbol} 875.00"),
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
