import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/textfield_primary.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/account/address/address_view.dart';
import 'package:smart_shop/screens/cart/success_view.dart';

import '../../helpers/base_getters.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  bool isCOD = false;
  @override
  Widget build(BuildContext context) {
    print(isCOD);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.btnActiveColor,
        foregroundColor: AppColors.bgWhite,
        elevation: 0,
        centerTitle: true,
        title: Text("Checkout", style: GetTextTheme.sf18_Bold),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Shipping Address", style: GetTextTheme.sf16_Bold),
              Card(
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.black100),
                    child:
                        const Icon(Icons.location_on, color: AppColors.bgWhite),
                  ),
                  title: Text("Home", style: GetTextTheme.sf14_Bold),
                  subtitle: Text(
                      "234, Central Facilty Bldf, Apmc Market-I, Opp Kataria Colony, Shivaji Park",
                      style: GetTextTheme.sf10_regular),
                  trailing: IconButton(
                      onPressed: () => AppServices.pushTo(
                          context, MyAddressView(selectAddress: true)),
                      icon: const Icon(Icons.edit,
                          color: AppColors.greenPrimary)),
                ),
              ),
              AppServices.addHeight(15.h),
              Text("Order Details", style: GetTextTheme.sf16_Bold),
              Card(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        leading:
                            Image.asset(AppImages.safolaImage, height: 35.h),
                        title:
                            Text("Safola Oats", style: GetTextTheme.sf16_Bold),
                        subtitle:
                            Text("200 gm", style: GetTextTheme.sf10_regular),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${AppServices.getCurrencySymbol} 209.00",
                                    style: GetTextTheme.sf14_Bold),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.w, vertical: 3.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: AppColors.btnActiveColor,
                                  ),
                                  child: Text("Qty: 2",
                                      style: GetTextTheme.sf12_Bold
                                          .copyWith(color: AppColors.bgWhite)),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              AppServices.addHeight(15.h),
              Text("Payment Method", style: GetTextTheme.sf16_Bold),
              Row(
                children: [
                  Expanded(
                      child: Card(
                    child: CheckboxListTile(
                        activeColor: AppColors.btnActiveColor,
                        title: Text("COD", style: GetTextTheme.sf12_Bold),
                        value: isCOD,
                        onChanged: (value) => setState(() => isCOD = true)),
                  )),
                  Expanded(
                      child: Card(
                    child: CheckboxListTile(
                        activeColor: AppColors.btnActiveColor,
                        title: Text("ONLINE", style: GetTextTheme.sf12_Bold),
                        value: !isCOD,
                        onChanged: (value) => setState(() => isCOD = false)),
                  )),
                ],
              ),
              AppServices.addHeight(15.h),
              Text("Promo Code", style: GetTextTheme.sf16_Bold),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              child:
                                  TextFieldPrimary(hint: "Enter Promo Code"))),
                      AppServices.addWidth(10.w),
                      TextButton(
                          onPressed: () {},
                          child: Text("Apply", style: GetTextTheme.sf12_Bold))
                    ],
                  ),
                ),
              ),
              AppServices.addHeight(15.h),
              Text("Payment Details", style: GetTextTheme.sf16_Bold),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Wrap(
                    runSpacing: 8.h,
                    children: [
                      amount_section(
                          "Amount", "${AppServices.getCurrencySymbol} 418.00"),
                      amount_section(
                          "Shipping", "${AppServices.getCurrencySymbol} 50.00"),
                      amount_section(
                          "Promo", "(-) ${AppServices.getCurrencySymbol} 0.00"),
                      const Divider(thickness: 1.2),
                      amount_section(
                          "Promo", "${AppServices.getCurrencySymbol} 468.00"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Row(
          children: [
            ExpandedButtonWidget(
                text: "Continue to Payment ➤",
                ontap: () => AppServices.pushTo(context, OrderSuccessView()))
          ],
        ),
      ),
    );
  }

  Row amount_section(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GetTextTheme.sf14_Regular),
        Text(value, style: GetTextTheme.sf14_Bold)
      ],
    );
  }
}
