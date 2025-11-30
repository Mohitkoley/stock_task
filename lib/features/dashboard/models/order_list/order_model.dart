import 'package:stock_task/features/dashboard/models/status_enum.dart';

class OrderModel {
  final String orderId;
  final Status status;
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
