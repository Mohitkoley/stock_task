import 'package:auto_route/auto_route.dart';
import 'package:common_extension/index.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:stock_task/core/di/service_locator.dart';
import 'package:stock_task/core/router/app_router.dart';
import 'package:stock_task/core/router/app_router.gr.dart';
import 'package:stock_task/features/auth/controllers/auth_controller.dart';

@RoutePage()
class SmsOtpScreen extends StatefulWidget {
  const SmsOtpScreen({super.key});

  @override
  State<SmsOtpScreen> createState() => _SmsOtpScreenState();
}

class _SmsOtpScreenState extends State<SmsOtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthController>();

    final defaultPinTheme = PinTheme(
      height: 60,
      width: 55,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade400),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(14),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(14),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              "Enter Verification Code",
              style: context.bodyMedium.copyWith(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "We have sent an OTP to your phone number.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 40),

            Pinput(
              controller: otpController,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              errorPinTheme: errorPinTheme,

              pinAnimationType: PinAnimationType.scale,
              onCompleted: (value) async {
                bool success = await vm.verifyOtp(value);
                if (success) {
                  ServiceLocator.getIt<AppRouter>().replaceAll([
                    const DashboardRoute(),
                  ]);
                  context.showSnack("Login Successful");
                } else {
                  context.showSnack(
                    "Incorrect OTP, try again.",
                    color: Colors.redAccent,
                  );
                }
              },
            ),

            const SizedBox(height: 40),

            vm.isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool success = await vm.verifyOtp(otpController.text);

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Verification Successful"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Incorrect OTP, try again."),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Verify",
                        style: context.bodyMedium.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
