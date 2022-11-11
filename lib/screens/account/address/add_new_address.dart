import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/classes/basic_models.dart';
import 'package:smart_shop/components/expanded_button.dart';
import 'package:smart_shop/components/toast.dart';
import 'package:smart_shop/helpers/base_getters.dart';
import 'package:smart_shop/providers/appdata_provider.dart';

import '../../../components/textfield_primary.dart';
import '../../../helpers/style_sheet.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  final TextEditingController _location = TextEditingController();
  final TextEditingController _flat = TextEditingController();
  final TextEditingController _landmark = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _title = TextEditingController();
  bool useCurrent = false;

  setAddress(bool value) {
    if (value) {
      setState(() {
        _location.text = "Central Facility Bldg, Apmc Market- I";
        _flat.text = "234";
        _landmark.text = "Opp Kataria Colony, Shivaji Park";
        _pincode.text = "123456";
        useCurrent = value;
      });
    } else {
      setState(() {
        _location.clear();
        _flat.clear();
        _landmark.clear();
        _pincode.clear();
        useCurrent = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.btnActiveColor,
        foregroundColor: AppColors.bgWhite,
        elevation: 0,
        centerTitle: true,
        title: Text("Add New Address", style: GetTextTheme.sf18_Bold),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  children: [
                    Checkbox(
                        value: useCurrent,
                        onChanged: (value) => setAddress(value!)),
                    AppServices.addWidth(20.w),
                    Text("User Current Location", style: GetTextTheme.sf14_Bold)
                  ],
                ),
              ),
              AppServices.addHeight(35.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldPrimary(controller: _location, hint: "Location"),
                  AppServices.addHeight(15.h),
                  TextFieldPrimary(controller: _flat, hint: "House/ Flat No."),
                  AppServices.addHeight(15.h),
                  TextFieldPrimary(controller: _landmark, hint: "Landmark"),
                  AppServices.addHeight(15.h),
                  TextFieldPrimary(controller: _pincode, hint: "Pincode"),
                  AppServices.addHeight(35.h),
                ],
              ),
              Text("Save As", style: GetTextTheme.sf12_Regular),
              AppServices.addHeight(15.h),
              TextFieldPrimary(controller: _title, hint: "Address Title"),
              AppServices.addHeight(45.h),
              Row(
                children: [
                  ExpandedButtonWidget(
                      text: "Submit", ontap: () => addNewAddress())
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  bool validateData() {
    if (_location.text.isEmpty ||
        _flat.text.isEmpty ||
        _landmark.text.isEmpty ||
        _pincode.text.isEmpty ||
        _title.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  addNewAddress() {
    final db = Provider.of<AppDataProvider>(context, listen: false);
    var _address = AddressModel(
        DateTime.now().millisecondsSinceEpoch.toString(),
        _location.text,
        _flat.text,
        _landmark.text,
        _pincode.text,
        _title.text);
    if (validateData()) {
      db.addNewAddress(_address);
      AppServices.popView(context);
    } else {
      toastMsg("Please fill all information");
    }
  }
}
