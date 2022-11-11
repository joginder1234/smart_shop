import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/components/basic_assets.dart';
import 'package:smart_shop/screens/home/home_screen.dart';
import 'package:smart_shop/screens/products/catalog_view.dart';

import '../../helpers/base_getters.dart';
import '../../helpers/style_sheet.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
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
            child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                physics: BouncingScrollPhysics(),
                itemCount: categories.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 8.w,
                    crossAxisSpacing: 8.w),
                itemBuilder: (context, i) {
                  final item = categories[i];
                  return InkWell(
                    onTap: () =>
                        AppServices.pushTo(context, ProductCatalogView()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Image.asset(item.image),
                              ),
                            )),
                        Text(item.title,
                            overflow: TextOverflow.ellipsis,
                            style: GetTextTheme.sf12_Bold)
                      ],
                    ),
                  );
                }),
          ))
        ],
      )),
    );
  }
}
