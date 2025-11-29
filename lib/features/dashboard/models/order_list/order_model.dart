import 'package:flutter/material.dart';
import 'package:stock_task/core/theme/color_palette.dart';

class OrderModel {
  final String orderId;
  final OrderStatus status;
  final String userName;
  final String projectName;
  final String address;
  final DateTime orderDate;

  OrderModel({
    required this.orderId,
    required this.status,
    required this.userName,
    required this.projectName,
    required this.address,
    required this.orderDate,
  });
}

enum OrderStatus { inProgress, complete, pending, approved, rejected }

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.inProgress:
        return "In Progress";
      case OrderStatus.complete:
        return "Complete";
      case OrderStatus.pending:
        return "Pending";
      case OrderStatus.approved:
        return "Approved";
      case OrderStatus.rejected:
        return "Rejected";
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.inProgress:
        return Colors.deepPurple;
      case OrderStatus.complete:
        return Colors.green;
      case OrderStatus.pending:
        return Colors.blue;
      case OrderStatus.approved:
        return Colors.yellow;
      case OrderStatus.rejected:
        return ColorPalette.textColor;
    }
  }
}
