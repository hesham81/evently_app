import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/core/extensions/center.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.routeName,
        (route) => false,
      );
    });
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
