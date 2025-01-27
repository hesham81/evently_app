import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() callBack;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.callBack,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        foregroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),
      onPressed: callBack,
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: AppColors.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.secondary,
              fontStyle: FontStyle.italic,
            ),
      ),
    );
  }
}
