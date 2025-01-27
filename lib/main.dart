import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/modules/splash_screen/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'modules/sign_in_screen/pages/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

var navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      theme: AppTheme.lightTheme(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
      },
    );
  }
}
