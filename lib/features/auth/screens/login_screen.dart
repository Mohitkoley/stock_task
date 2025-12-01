// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:common_extension/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:stock_task/const/resource.dart';
import 'package:stock_task/core/mixin/validator_mixin.dart';
import 'package:stock_task/core/router/app_router.gr.dart';
import 'package:stock_task/features/auth/controllers/auth_controller.dart';
import 'package:stock_task/features/auth/widgets/social_signin_widget.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = .new();

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.w,
        height: context.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.ASSETS_IMAGES_PNG_AUTH_BG_PNG),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Column(
                children: [
                  Image.asset(
                    R.ASSETS_IMAGES_PNG_CHATGPT_PNG,
                    width: context.w * 0.25,
                    height: context.h * 0.15,
                    color: Colors.white,
                  ),
                  Text(
                    "ChatGPT",
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  (context.h * 0.3).hBox,
                  Row(
                    spacing: 10,
                    mainAxisAlignment: .center,
                    children: [
                      SocialSigninWidget(
                        color: Colors.deepPurpleAccent,
                        iconPath: R.ASSETS_IMAGES_PNG_GOOGLE_PNG,
                      ),
                      SocialSigninWidget(
                        color: Colors.white,
                        iconPath: R.ASSETS_IMAGES_PNG_APPLE_PNG,
                      ),
                      SocialSigninWidget(
                        color: Colors.blueAccent,
                        iconPath: R.ASSETS_IMAGES_PNG_FACEBOOK_PNG,
                        filterColor: Colors.white,
                      ),
                    ],
                  ),
                  20.hBox,
                  Divider(color: Colors.white.withAlpha(100), thickness: 1.5),
                  20.hBox,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),

                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(20),
                        ),
                        child: TextFormField(
                          controller: _phoneController,
                          validator: isValidPhonNumer,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email or Phone Number",
                            hintStyle: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white.withAlpha(
                              50,
                            ), // Example: 50% opaque white
                            // Other decoration properties like borders, hints, etc.
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.hBox,
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthController>().sendOtp(
                          _phoneController.text,
                        );
                        context.router.push(SmsOtpRoute());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ), // reduce vertical padding
                      minimumSize: Size(context.w, 40), // control height
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Sign In or Sign up",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  20.hBox,
                  Row(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Create Account",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
