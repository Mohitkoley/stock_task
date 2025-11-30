// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:common_extension/common_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:stock_task/const/resource.dart';
import 'package:stock_task/core/router/app_router.gr.dart';
import 'package:stock_task/core/theme/color_palette.dart';
import 'package:stock_task/features/dashboard/controllers/dashboard_controller.dart';
import 'package:stock_task/features/dashboard/widgets/bottom_toolbar.dart';
import 'package:stock_task/features/dashboard/widgets/chart/line_chart_widget.dart';
import 'package:stock_task/features/dashboard/widgets/chart/product_traffic_chart.dart';
import 'package:stock_task/features/dashboard/widgets/chart/traffic_bar_chart.dart';
import 'package:stock_task/features/dashboard/widgets/project_list_widget.dart';
import 'package:stock_task/features/dashboard/widgets/stat_card.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> labels = [
    "Linux",
    "Mac",
    "iOS",
    "Windows",
    "Android",
    "Other",
  ];
  final List<String> labels2 = [
    "US",
    "Canada",
    "Mexico",
    "China",
    "Japan",
    "Australia",
  ];
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
      body: Consumer<DashboardController>(
        builder: (context, controller, _) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(
                    20.0,
                  ).copyWith(bottom: 0, top: 0),
                  child: Column(
                    spacing: 20,
                    children: [
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: controller.stats
                            .map((e) => StatCard(data: e))
                            .toList(),
                      ),
                      LineChartWidget(),
                      TrafficBarChart(
                        title: "Device Traffic",
                        titleColor: const Color(0xFF4C7DFF),
                        labels: labels,
                        values: [500, 1000, 700, 1300, 243, 600],
                        highlightGradient: const LinearGradient(
                          colors: [Color(0xFF4C7DFF), Color(0xFF408CFF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      TrafficBarChart(
                        title: "Location Traffic",
                        titleColor: Color(0xFF17C964),
                        labels: labels2,
                        values: [900, 1500, 1100, 800, 1400, 950],
                        highlightGradient: const LinearGradient(
                          colors: [Color(0xFF17C964), Color(0xFF0EA75A)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      ProductTrafficBarChart(),

                      Container(
                        padding: const EdgeInsets.all(
                          18,
                        ).copyWith(bottom: 0, top: 10),
                        decoration: BoxDecoration(
                          color: ColorPalette.tileColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: .topLeft,
                              child: Text(
                                "Projects",
                                style: context.bodyLarge.copyWith(
                                  color: Colors.cyanAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            10.hBox,
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.projects.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final project = controller.projects[index];
                                return ProjectListWidget(
                                  backgroundColor: index % 2 == 0
                                      ? ColorPalette.scaffoldBackground
                                      : ColorPalette.textColor.withAlpha(20),
                                  project: project,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      icon: const Icon(
                        CupertinoIcons.bell,
                        color: Colors.white,
                      ),
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
          );
        },
      ),
    );
  }
}
