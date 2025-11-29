import 'package:common_extension/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:stock_task/core/theme/color_palette.dart';

class BottomToolbar extends StatelessWidget {
  const BottomToolbar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // bottom navigation bar
      width: context.w,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorPalette.bottomToolbarColor,
        borderRadius: BorderRadius.circular(30),
      ),

      alignment: Alignment.center,
      child: child,
    );
  }
}
