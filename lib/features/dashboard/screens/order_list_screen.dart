import 'package:auto_route/auto_route.dart';
import 'package:common_extension/common_extension.dart';
import 'package:common_extension/context_extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_task/core/theme/color_palette.dart';
import 'package:stock_task/features/dashboard/controllers/dashboard_controller.dart';
import 'package:stock_task/features/dashboard/models/order_list/order_model.dart';
import 'package:stock_task/features/dashboard/widgets/bottom_toolbar.dart';
import 'package:stock_task/features/dashboard/widgets/order_list_widget.dart';

@RoutePage()
class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final double iconSize = 35;

  DashboardController get dashboardController =>
      context.watch<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Order List",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              separatorBuilder: (context, index) => 20.hBox,
              itemBuilder: (context, index) {
                final order = dashboardController.orders[index];
                return OrderListWidget(order: order);
              },
              itemCount: dashboardController.orders.length,
            ),
          ),
          BottomToolbar(
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: iconSize,
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: iconSize,
                      icon: Icon(Icons.filter_list),
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: iconSize,
                      icon: Icon(Icons.swap_vert),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: iconSize,
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
