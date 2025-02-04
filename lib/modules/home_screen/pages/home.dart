import 'package:evently/core/widget/category_widget.dart';

import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.secondary,
        shape: CircleBorder(
            side: BorderSide(
          color: AppColors.primary,
          width: 5,
        )),
        child: Icon(
          Icons.add,
          color: AppColors.primary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondary,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.primary,
        selectedItemColor: AppColors.primary,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.primary,
            ),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            activeIcon: Icon(
              Icons.location_on_rounded,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            activeIcon: Icon(
              Icons.favorite,
            ),
            label: "Love",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(
              Icons.person,
            ),
            label: "Love",
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
