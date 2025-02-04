import 'package:evently/core/widget/category_widget.dart';

import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  Home({super.key});

  List<CategoryWidget> categories = [
    CategoryWidget(
      icon: SvgPicture.asset(AppAssets.all),
      text: "All",
    ),
    CategoryWidget(
      icon: SvgPicture.asset(AppAssets.sports),
      text: "Sports",
      isSelected: true,
      selectedColor: AppColors.whiteColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Container(
            height: 0.3.height,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Hisham Aymen ",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        AppAssets.sun,
                      ),
                      0.03.verSpace,
                      SizedBox(
                        width: 0.1.width,
                        height: 0.04.height,
                        child: CustomElevatedButton(
                          callBack: () {},
                          backgroundColor: AppColors.whiteColor,
                          text: Text(
                            "EN",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: AppColors.secondary,
                            ),
                          ),
                          borderRadius: 9,
                        ),
                      ),
                      0.03.verSpace,
                    ],
                  ),
                  0.01.horSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.pin_drop_outlined,
                        color: AppColors.whiteColor,
                      ),
                      0.01.verSpace,
                      Text(
                        "Cairo, Egypt",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  0.02.horSpace,
                  TabBar(
                    tabs: categories,
                  ),
                ],
              ).allPadding(0.01.height),
            ),
          )
        ],
      ),
    );
  }
}
