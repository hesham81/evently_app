import 'dart:developer';

import 'package:evently/core/utils/firebase_services.dart';
import 'package:evently/core/utils/firestore_services.dart';
import 'package:evently/core/widget/category_widget.dart';
import 'package:evently/modules/home_screen/widget/tab_icons.dart';
import 'package:evently/modules/splash_screen/pages/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../models/event_model.dart';
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
  int selectedTabIndex = 0;
  List<String> category = [
    "All",
    "Sports",
    "Birthday",
    "Games",
    "Book Club",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var _id = FireStoreServices.generateId(
            value2: "sports",
            value1: 'Tech Conference 2023',
          );
          EasyLoading.show();
          EventModel myEvent = EventModel(
            id: _id,
            event: 'Tech Conference 2023',
            isLiked: false,
            uid: 'user123',
            category: category[selectedTabIndex],
            eventDate: DateTime(2023, 12, 15),
            lantitude: '40.7128',
            longitude: '-74.0060',
          );
          EasyLoading.dismiss();
          var response = FireStoreServices.addNewEvent(event: myEvent);
          (response == null)
              ? log("Data Inserted Succefully")
              : log(response.toString());
        },
        backgroundColor: AppColors.secondary,
        shape: CircleBorder(
          side: BorderSide(
            color: AppColors.primary,
            width: 5,
          ),
        ),
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Expanded(
                child: DefaultTabController(
                  length: 5,
                  initialIndex: selectedTabIndex,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset(AppAssets.sun),
                          0.02.verSpace,
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: CustomElevatedButton(
                              callBack: () {
                                FirebaseAuthServices.logout();
                                Navigator.pushReplacementNamed(
                                  context,
                                  SplashScreen.routeName,
                                );
                              },
                              backgroundColor: AppColors.whiteColor,
                              borderRadius: 8,
                              padding: EdgeInsets.zero,
                              child: Text(
                                "EN",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ),
                          ),
                          0.01.verSpace,
                        ],
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser!.displayName!
                                .toUpperCase() ??
                            "No Name",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      0.02.height.verSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.whiteColor,
                          ),
                          Text(
                            "Cairo , Egypt",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      TabBar(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                        onTap: _onTabClicked,
                        tabs: [
                          TabIcons.home(
                            icon: Icons.all_inclusive_outlined,
                            text: "All",
                            isSelected: (selectedTabIndex == 0),
                          ),
                          TabIcons.home(
                            icon: Icons.directions_bike_sharp,
                            text: "Sports",
                            isSelected: (selectedTabIndex == 1),
                          ),
                          TabIcons.home(
                            icon: Icons.cake_outlined,
                            text: "Birthday",
                            isSelected: (selectedTabIndex == 2),
                          ),
                          TabIcons.home(
                            icon: Icons.gamepad,
                            text: "Games",
                            isSelected: (selectedTabIndex == 3),
                          ),
                          TabIcons.home(
                            icon: Icons.menu_book_sharp,
                            text: "Book Club",
                            isSelected: (selectedTabIndex == 4),
                          ),
                        ],
                      ),
                    ],
                  ).allPadding(0.01.height),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTabClicked(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
