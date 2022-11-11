import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/home/home_screen.dart';
import 'package:smart_shop/screens/products/productDetails.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String dropDownValue = "0.5 Litre";
  List<String> quantity = [
    "0.5 Litre",
    "1 Litre",
    "1.5 Litre",
    "2 Litre",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ScreenHeaderOne(),
          AppServices.addHeight(10.h),
          ScreenHeaderTwo(autoBackButton: true),
          Expanded(
              child: SizedBox(
            child: ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        AppServices.pushTo(context, ProductDetailsView());
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w)
                              .copyWith(top: 10.h, bottom: 5.h),
                          child: Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Stack(children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Image.asset(AppImages.watchImage,
                                          scale:
                                              AppServices.scaleFactor(context),
                                          height: 60.h),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: AppColors.btnActiveColor),
                                      child: Text("5.0%",
                                          style: GetTextTheme.sf10_Bold
                                              .copyWith(
                                                  color: AppColors.bgWhite)),
                                    )
                                  ])),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Creamy Strawberry",
                                      style: GetTextTheme.sf14_Bold,
                                      overflow: TextOverflow.ellipsis),
                                  Row(
                                    children: [
                                      Text(
                                        "${AppServices.getCurrencySymbol} 350.0",
                                        style: GetTextTheme.sf14_Regular
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                      ),
                                      AppServices.addWidth(20.w),
                                      Text(
                                          "${AppServices.getCurrencySymbol} 332.5",
                                          style: GetTextTheme.sf14_Bold),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: AppColors.btnActiveColor,
                                      ),
                                      Text(
                                        "4.5",
                                        style: GetTextTheme.sf12_Bold,
                                      ),
                                      AppServices.addWidth(20.w),
                                      Text(
                                        "35 Reviews",
                                        style: GetTextTheme.sf12_Bold,
                                      )
                                    ],
                                  ),
                                  DropdownButton<String>(
                                      value: dropDownValue,
                                      items: quantity
                                          .map((e) => DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: GetTextTheme.sf14_Bold,
                                              )))
                                          .toList(),
                                      onChanged: (value) => setState(() {
                                            dropDownValue = value!;
                                          }))
                                ],
                              )),
                              TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.greenPrimary)),
                                  onPressed: () {},
                                  child: Text(
                                    "Add",
                                    style: GetTextTheme.sf14_Bold
                                        .copyWith(color: AppColors.bgWhite),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )),
          ))
        ],
      )),
    );
  }
}
