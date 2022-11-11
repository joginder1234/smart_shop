import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';

class CartMainView extends StatefulWidget {
  const CartMainView({super.key});

  @override
  State<CartMainView> createState() => _CartMainViewState();
}

class _CartMainViewState extends State<CartMainView> {
  int qnty = 1;
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.btnActiveColor,
        foregroundColor: AppColors.bgWhite,
        centerTitle: true,
        title: Text("Cart", style: GetTextTheme.sf18_Bold),
        bottom: PreferredSize(
            preferredSize: Size(AppServices.getScreenWidth(context), 30.h),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                color: AppColors.textLightColor,
                child: Row(
                  children: [
                    Image.asset(AppIcons.locationIcon,
                        color: AppColors.bgWhite, height: 15.h),
                    AppServices.addWidth(10.w),
                    Text("Deliver to: 123579",
                        style: GetTextTheme.sf12_Bold
                            .copyWith(color: AppColors.bgWhite))
                  ],
                ),
              ),
            )),
      ),
      body: SafeArea(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.safolaImage, height: 55.h),
                            AppServices.addWidth(15.w),
                            Expanded(
                                child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Safola Oats",
                                      style: GetTextTheme.sf16_Bold),
                                  AppServices.addHeight(5.h),
                                  Row(
                                    children: [
                                      Text(
                                          "${AppServices.getCurrencySymbol} 212.00",
                                          style: GetTextTheme.sf12_Regular
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough)),
                                      AppServices.addWidth(40.w),
                                      Text("200 gm",
                                          style: GetTextTheme.sf12_Regular
                                              .copyWith(
                                                  color: AppColors
                                                      .textLightColor)),
                                    ],
                                  ),
                                  AppServices.addHeight(8.h),
                                  Text(
                                      "${AppServices.getCurrencySymbol} 209.00",
                                      style: GetTextTheme.sf14_Bold),
                                ],
                              ),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      IconButton(
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
                                          onPressed: () => qnty < 20
                                              ? setState(() => qnty++)
                                              : null,
                                          icon: const Icon(Icons.add_circle,
                                              color: AppColors.btnActiveColor)),
                                    ],
                                  ),
                                )),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 2,
                                child: SizedBox(
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text("Delete",
                                            style: GetTextTheme.sf12_Bold)))),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
        child: Card(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 350),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.bgWhite),
            width: AppServices.getScreenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => setState(() => showDetails = !showDetails),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Details", style: GetTextTheme.sf12_Regular),
                      Icon(showDetails
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.keyboard_arrow_up_outlined)
                    ],
                  ),
                ),
                showDetails
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppServices.addHeight(5.h),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal:",
                                  style: GetTextTheme.sf12_Regular),
                              Text("${AppServices.getCurrencySymbol} 627.00",
                                  textAlign: TextAlign.right,
                                  style: GetTextTheme.sf12_Bold),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount:",
                                  style: GetTextTheme.sf12_Regular),
                              Text("${AppServices.getCurrencySymbol} 00.00",
                                  textAlign: TextAlign.right,
                                  style: GetTextTheme.sf12_Bold),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery Charge:",
                                  style: GetTextTheme.sf12_Regular),
                              Text("${AppServices.getCurrencySymbol} 50.00",
                                  textAlign: TextAlign.right,
                                  style: GetTextTheme.sf12_Bold),
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                AppServices.addHeight(10.h),
                Row(
                  children: [
                    ExpandedButtonWidget(
                        text:
                            "Proceed to pay ${AppServices.getCurrencySymbol} 627.00",
                        ontap: () {})
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
