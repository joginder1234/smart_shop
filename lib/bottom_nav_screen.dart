import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_shop/classes/basic_models.dart';
import 'package:smart_shop/components/my_bottom_navbar.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';
import 'package:smart_shop/screens/account/account_main.dart';
import 'package:smart_shop/screens/cart/cart.dart';
import 'package:smart_shop/screens/category/category_view.dart';
import 'package:smart_shop/screens/home/home_screen.dart';
import 'package:smart_shop/screens/notification/notification_view.dart';

class BottomNavScreenView extends StatefulWidget {
  int routeIndex;
  BottomNavScreenView({super.key, this.routeIndex = 0});

  @override
  State<BottomNavScreenView> createState() => _BottomNavScreenViewState();
}

class _BottomNavScreenViewState extends State<BottomNavScreenView> {
  final List<Widget> _screens = [
    HomePageView(),
    CategoryView(),
    CartMainView(),
    NotificationView(),
    AccountMainview()
  ];
  final List<MyBottomBarItems> _items = [
    MyBottomBarItems(AppIcons.homeIcon, "Home"),
    MyBottomBarItems(AppIcons.listIcon, "Category"),
    MyBottomBarItems(AppIcons.shoppingIcon, "Cart"),
    MyBottomBarItems(AppIcons.notificationIcon, "Notification"),
    MyBottomBarItems(AppIcons.userIcon, "Account"),
  ];

  int activeIndex = 0;

  @override
  void initState() {
    setState(() => activeIndex = widget.routeIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[activeIndex],
      bottomNavigationBar: MyBottomNavBar(
          items: _items,
          onChange: (index) => setState(() => activeIndex = index),
          activeIndex: activeIndex),
    );
  }
}
