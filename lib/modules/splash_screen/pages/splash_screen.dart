import 'dart:async';

import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/core/services/shared_preferences_services.dart';
import 'package:evently/core/utils/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home_screen/pages/home.dart';
import '/core/constant/shared_preferences_key.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../sign_in_screen/pages/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SharedPreferencesServices.init();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        Timer(
          Duration(seconds: 3),
          () {
            // (FirebaseAuthServices.getCurrentUser() == null)
            //     ? Navigator.pushReplacementNamed(
            //         context,
            //         SignInScreen.routeName,
            //       )
            //     : Navigator.pushReplacementNamed(
            //         context,
            //         Home.routeName,
            //       );
            Navigator.pushReplacementNamed(
              context,
              SignInScreen.routeName,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.logo,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppAssets.brand,
              ),
            ),
          )
        ],
      ),
    );
  }
}
