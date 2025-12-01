import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stock_task/core/service/local_notification_service.dart';
import 'package:stock_task/core/service/storage_service.dart';

import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  AuthController();

  final NotificationService _notificationService = NotificationService();
  final StorageService _storageService = StorageService();

  String? generatedOtp;
  bool isLoading = false;
  String? error;
  String phone = "";

  Future<void> sendOtp(String phone) async {
    // if (!isValidPhone(phone)) {
    //   error = "Invalid phone number";
    //   notifyListeners();
    //   return;
    // }
    this.phone = phone;

    isLoading = true;
    error = null;
    notifyListeners();

    generatedOtp = (100000 + Random().nextInt(900000)).toString();

    await _notificationService.showOtpNotification(generatedOtp!);

    isLoading = false;
    notifyListeners();
  }

  Future<bool> verifyOtp(String enteredOtp) async {
    if (enteredOtp == generatedOtp) {
      await _storageService.saveLogin(phone);
      return true;
    }
    return false;
  }
}
