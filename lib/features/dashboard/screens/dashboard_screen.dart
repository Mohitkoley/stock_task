// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:common_extension/common_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stock_task/const/resource.dart';
import 'package:stock_task/core/router/app_router.gr.dart';
import 'package:stock_task/core/theme/color_palette.dart';
import 'package:stock_task/features/dashboard/widgets/bottom_toolbar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Overview",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView()),
          BottomToolbar(
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home_filled, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    context.router.push(OrderListRoute());
                  },
                  icon: const Icon(Icons.history, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bell, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    context.router.push(const UserInfoRoute());
                  },
                  child: Image.asset(
                    R.ASSETS_IMAGES_PNG_USER_PNG,
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
