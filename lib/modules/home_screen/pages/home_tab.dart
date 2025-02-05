import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/modules/home_screen/widget/event_cart.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/core/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/firebase_services.dart';
import '../../../core/utils/firestore_services.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/tab_icons.dart';
import '../../splash_screen/pages/splash_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          0.01.horSpace,
          Column(
            children: [
              StreamBuilder(
                stream: FireStoreServices.getStreamEvents(),
                builder: (context, snapshot) {
                  // if (!snapshot.hasData) {
                  //   log("There is no data");
                  //   return Text(
                  //     "No Data",
                  //     style: TextStyle(
                  //       fontSize: 28,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.red,
                  //     ),
                  //   );
                  // }
                  // if (snapshot.connectionState == ConnectionState.waiting)
                  //   {
                  //     EasyLoading.show();
                  //   }
                  // if(snapshot.connectionState == ConnectionState.done)
                  //   {
                  //     EasyLoading.dismiss();
                  //   }
                  // if (snapshot.hasError) {
                  //  EasyLoading.showError("${snapshot.error}");
                  // }
                  List<EventModel> filter = [];
                  List<EventModel?> data = snapshot.data!.docs
                      .map((QueryDocumentSnapshot<Object?> event) {
                    EventModel model = event.data() as EventModel;
                    if (model.uid ==
                        FirebaseAuthServices.getCurrentUser()!.uid.toString()) {
                      filter.add(model);
                    }
                    return event.data() as EventModel;
                  }).toList();
                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => EventCart(
                      model: filter[index],
                    ),
                    separatorBuilder: (context, _) => 0.01.horSpace,
                    itemCount: filter.length,
                  );
                },
              ),
            ],
          ).verPadding(0.02),
        ],
      ),
    );
  }

  _onTabClicked(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
