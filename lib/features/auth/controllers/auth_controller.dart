import 'package:flutter/material.dart';
import '../repositories/auth_repo.dart';

import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _repo;

  AuthController(this._repo);

  bool isLoading = false;
  String? verificationId;
  String? errorMessage;

  Future<void> sendOtp(String phoneNumber) async {
    try {
      isLoading = true;
      notifyListeners();

      verificationId = await _repo.sendOtp(phoneNumber);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp(String otp) async {
    try {
      isLoading = true;
      notifyListeners();

      await _repo.verifyOtp(verificationId: verificationId!, smsCode: otp);

      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
