import '/modules/home_screen/pages/fav_page.dart';
import '/modules/home_screen/pages/home_tab.dart';
import '/modules/home_screen/pages/maps.dart';
import '/modules/home_screen/pages/profile.dart';
import '/modules/add_event/pages/add_event.dart';
import '/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pages = [
    HomeTab(),
    Maps(),
    FavPage(),
    Profile(),
  ];
  int selectedIndex = 0;
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
          Navigator.pushNamed(
            context,
            AddEvent.routeName,
          );
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
      body: pages[selectedIndex],
    );
  }

  _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
