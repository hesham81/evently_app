import 'package:evently/core/extensions/extensions.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color? btnColor;

  final Color? textColor;

  final Color? iconColor;

  final Color? borderColor;

  final bool isSelected;
  final Color? selectedColor;

  final EdgeInsets? padding;

  const CategoryWidget({
    super.key,
    required this.icon,
    required this.text,
    this.btnColor,
    this.textColor,
    this.iconColor,
    this.borderColor,
    this.isSelected = false,
    this.padding,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:
            (isSelected) ? selectedColor : (btnColor) ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: (borderColor) ?? AppColors.primary,
          ),
        ),
        padding: (padding) ?? EdgeInsets.zero,
      ),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            0.015.verSpace,
            Text(
              text,
              style: TextStyle(
                color: (textColor) ?? AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).verPadding(0.05).centerWidget(),
      ),
    );
  }
}
