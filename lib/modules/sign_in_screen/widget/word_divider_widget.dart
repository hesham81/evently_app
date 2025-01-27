import 'package:evently/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class WordDividerWidget extends StatelessWidget {
  final Color? color;
  final String text;

  const WordDividerWidget({
    super.key,
    this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        0.05.verSpace,
        Expanded(
          child: Divider(
            color: color ?? AppColors.secondary,
            thickness: 1,
            endIndent: 15,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: color ?? AppColors.secondary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: color ?? AppColors.secondary,
            thickness: 1,
            indent: 15,
          ),
        ),
        0.05.verSpace,
      ],
    );
  }
}
