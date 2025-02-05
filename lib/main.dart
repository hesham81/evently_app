import 'package:bot_toast/bot_toast.dart';
import '/core/services/shared_preferences_services.dart';
import '/core/theme/app_theme.dart';
import '/modules/home_screen/pages/home.dart';
import '/modules/splash_screen/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';
import 'modules/add_event/pages/add_event.dart';
import 'modules/forget_password/pages/forget_password.dart';
import 'modules/sign_in_screen/pages/sign_in_screen.dart';
import 'modules/sign_up_screen/pages/sign_up_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferencesServices.init();
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
      theme: AppTheme.lightTheme,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        SignInScreen.routeName: (context) => SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        Home.routeName: (context) => Home(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        AddEvent.routeName: (context) => AddEvent(),
      },
    );
  }
}
