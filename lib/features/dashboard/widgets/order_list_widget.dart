import 'package:common_extension/context_extension/context_ext.dart';
import 'package:common_extension/num_extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:stock_task/core/theme/color_palette.dart';
import 'package:stock_task/features/dashboard/models/order_list/order_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorPalette.tileColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                order.orderId,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: order.status.color.withAlpha(50),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order.status.displayName,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: order.status.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "User",
                style: context.titleMedium.copyWith(
                  color: ColorPalette.textColor,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.person_pin),
                  5.wBox,
                  Text(order.userName, style: context.titleMedium),
                ],
              ),
            ],
          ),
          Divider(color: Colors.white.withAlpha(70), thickness: 1),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "Project",
                style: context.titleMedium.copyWith(
                  color: ColorPalette.textColor,
                ),
              ),
              Text(order.projectName, style: context.titleMedium),
            ],
          ),
          Divider(color: Colors.white.withAlpha(70), thickness: 1),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "Address",
                style: context.titleMedium.copyWith(
                  color: ColorPalette.textColor,
                ),
              ),
              Text("\$${order.address}", style: context.titleMedium),
            ],
          ),
          Divider(color: Colors.white.withAlpha(70), thickness: 1),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "Date",
                style: context.titleMedium.copyWith(
                  color: ColorPalette.textColor,
                ),
              ),
              Text(timeago.format(order.orderDate), style: context.titleMedium),
            ],
          ),
        ],
      ),
    );
  }
}
