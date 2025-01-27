import 'package:bot_toast/bot_toast.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/modules/splash_screen/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'modules/sign_in_screen/pages/sign_in_screen.dart';
import 'modules/sign_up_screen/pages/sign_up_screen.dart';

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
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
      },
    );
  }
}
