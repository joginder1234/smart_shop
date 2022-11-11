import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/components/basic_assets.dart';
import 'package:smart_shop/components/product_tile_one.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/products/products_view.dart';

import '../../helpers/base_getters.dart';
import '../home/home_screen.dart';

class ProductCatalogView extends StatefulWidget {
  const ProductCatalogView({super.key});

  @override
  State<ProductCatalogView> createState() => _ProductCatalogViewState();
}

class _ProductCatalogViewState extends State<ProductCatalogView> {
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: BannerSliderView()),
                    Divider(thickness: 1.2),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          final subCat = subCategories[i];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(subCat.title,
                                    style: GetTextTheme.sf20_Bold),
                              ),
                              Divider(thickness: 1.2),
                              GridView.builder(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 10.h),
                                  shrinkWrap: true,
                                  itemCount: subCat.items.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              AppServices.isSmallScreen(context)
                                                  ? 2
                                                  : 3),
                                  itemBuilder: (ctx, j) {
                                    final item = subCat.items[i];
                                    return GestureDetector(
                                      onTap: () {
                                        AppServices.pushTo(
                                            context, const ProductsView());
                                      },
                                      child: ProductTile(
                                          centertitle: true,
                                          imageUrl: item.image,
                                          productName: item.title,
                                          basicPrice: ""),
                                    );
                                  })
                            ],
                          );
                        },
                        separatorBuilder: (context, i) =>
                            Divider(thickness: 1.2),
                        itemCount: subCategories.length)
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
