import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double borderRadius;
  final Text? text;
  final Widget? child;

  final double textSize;
  final Color? textColor;
  final Color? backgroundColor;
  final Function() callBack;
  final Color? borderColor;
  final EdgeInsets? padding;

  const CustomElevatedButton({
    super.key,
    this.borderRadius = 16,
    this.text,
    required this.callBack,
    this.textSize = 20,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.child,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: (padding) ?? EdgeInsets.zero,
        backgroundColor: (backgroundColor) ?? AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: (borderColor) ?? AppColors.secondary,
          ),
        ),
      ),
      onPressed: callBack,
      child: text ?? child,
    );
  }
}
