import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/providers/appdata_provider.dart';
import 'package:smart_shop/screens/account/address/add_new_address.dart';

import '../../../components/expanded_button.dart';
import '../../../helpers/style_sheet.dart';

class MyAddressView extends StatefulWidget {
  bool selectAddress;
  MyAddressView({super.key, this.selectAddress = false});

  @override
  State<MyAddressView> createState() => _MyAddressViewState();
}

class _MyAddressViewState extends State<MyAddressView> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.btnActiveColor,
          foregroundColor: AppColors.bgWhite,
          elevation: 0,
          centerTitle: true,
          title: Text("Address", style: GetTextTheme.sf18_Bold),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Center(
              child: TextButton(
                  onPressed: () =>
                      AppServices.pushTo(context, AddNewAddressView()),
                  child: Text("+ Add Address",
                      style: GetTextTheme.sf14_Bold
                          .copyWith(color: AppColors.black100))),
            ),
            AppServices.addHeight(20.h),
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, i) {
                      final address = db.getAddressList[i];
                      return ListTile(
                        title:
                            Text(address.title, style: GetTextTheme.sf14_Bold),
                        subtitle: Text(
                            "${address.houseNo}, ${address.location}, ${address.landmark}, (${address.pincode}),",
                            style: GetTextTheme.sf12_Regular),
                        trailing: widget.selectAddress
                            ? Checkbox(
                                value: isActive,
                                onChanged: (v) =>
                                    setState(() => isActive = !isActive))
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit,
                                          color: AppColors.greenPrimary)),
                                  IconButton(
                                      onPressed: () =>
                                          db.removeAddress(address.id),
                                      icon: const Icon(Icons.delete,
                                          color: AppColors.btnActiveColor)),
                                ],
                              ),
                      );
                    },
                    separatorBuilder: (ctx, i) => const Divider(thickness: 1.2),
                    itemCount: db.getAddressList.length),
              ),
            )
          ],
        )),
        bottomNavigationBar: widget.selectAddress
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Row(
                  children: [ExpandedButtonWidget(text: "Apply", ontap: () {})],
                ),
              )
            : SizedBox());
  }
}
