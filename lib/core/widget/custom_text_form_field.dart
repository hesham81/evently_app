import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/core/extensions/extensions.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final double radius;
  final Color? borderColor;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool isPassword;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.radius = 16,
    this.borderColor,
    this.suffixIcon,
    this.isPassword = false,
    this.prefixIcon,
    required this.hintText,
    this.hintStyle,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  var visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: widget.controller,
      obscureText: visible,
      obscuringCharacter: "*",
      cursorColor: AppColors.secondary,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
              color: AppColors.greyColor.withAlpha(180),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
        suffixIcon: (widget.isPassword)
            ? (visible)
                ? IconButton(
                    style: IconButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: Icon(
                      Icons.visibility_outlined,
                      color: AppColors.greyColor.withAlpha(180),
                    ),
                  )
                : IconButton(
                    style: IconButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.greyColor.withAlpha(180),
                    ),
                  )
            : widget.suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.greyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.greyColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.greyColor,
          ),
        ),
        prefixIcon: (widget.isPassword)
            ? ImageIcon(
                AssetImage(
                  AppAssets.lock,
                ),
                color: AppColors.greyColor.withAlpha(180),
              ).allPadding(9)
            : widget.prefixIcon ??
                ImageIcon(
                  AssetImage(
                    AppAssets.email,
                  ),
                  color: AppColors.greyColor.withAlpha(180),
                ).allPadding(9),
      ),
    );
  }
}
