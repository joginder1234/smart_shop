import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_shop/helpers/style_sheet.dart';
import 'package:smart_shop/screens/home/home_screen.dart';
import 'package:smart_shop/screens/orders/completed_order.dart';
import 'package:smart_shop/screens/orders/ongoing_order.dart';

class OrderMainView extends StatefulWidget {
  const OrderMainView({super.key});

  @override
  State<OrderMainView> createState() => _OrderMainViewState();
}

class _OrderMainViewState extends State<OrderMainView>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  final List<Widget> _tabScreens = [
    const OngoingOrderView(),
    const CompletedOrderview()
  ];
  final List<Tab> _tabs = [
    const Tab(text: "Ongoing"),
    const Tab(text: "Completed"),
  ];
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ScreenHeaderTwo(autoBackButton: true),
          TabBar(
              controller: _controller,
              tabs: _tabs,
              labelColor: AppColors.black100,
              labelStyle: GetTextTheme.sf14_Bold,
              indicatorColor: AppColors.btnActiveColor,
              unselectedLabelColor: AppColors.textLightColor),
          Expanded(
              child: SizedBox(
            child: TabBarView(
                physics: ClampingScrollPhysics(),
                controller: _controller,
                children: _tabScreens),
          ))
        ],
      )),
    );
  }
}
