import 'package:evently/core/extensions/extensions.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widget/category_widget.dart';
import 'package:flutter/material.dart';

class TabIcons extends StatefulWidget {
  final Color? btnColor;
  final Color? borderColor;
  final bool isSelected;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final IconData? icon;
  final String text;
  final Function()? callback;

  const TabIcons.home({
    super.key,
    this.btnColor = Colors.white,
    this.borderColor = Colors.white,
    this.isSelected = false,
    this.selectedColor = Colors.white,
    this.unSelectedColor,
    required this.icon,
    required this.text,
    this.callback,
  });

  const TabIcons.createEvent({
    super.key,
    this.btnColor ,
    this.borderColor = Colors.blue,
    this.isSelected = false,
    this.selectedColor = Colors.white,
    this.unSelectedColor = Colors.blue,
    required this.icon,
    required this.text,
    this.callback,
  });

  @override
  State<TabIcons> createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: (widget.isSelected)
            ? widget.btnColor
            : widget.selectedColor ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: widget.borderColor!,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: (widget.isSelected)
                ? widget.unSelectedColor ?? AppColors.secondary
                : AppColors.whiteColor,
          ),
          0.01.verSpace,
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: (widget.isSelected)
                  ? widget.unSelectedColor ?? AppColors.secondary
                  : AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
