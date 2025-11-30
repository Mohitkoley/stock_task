import 'package:common_extension/context_extension/context_ext.dart'
    show ContextExt;
import 'package:flutter/material.dart';

class SocialSigninWidget extends StatelessWidget {
  const SocialSigninWidget({
    super.key,
    required this.color,
    required this.iconPath,
    this.filterColor,
  });
  final Color color;
  final String iconPath;
  final Color? filterColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 70,
        width: context.w * 0.27,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: .center,
        child: Image.asset(iconPath, height: 30, width: 30, color: filterColor),
      ),
    );
  }
}
