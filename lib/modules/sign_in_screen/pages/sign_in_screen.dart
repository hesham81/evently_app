import 'package:firebase_auth/firebase_auth.dart';
import '../../sign_up_screen/pages/sign_up_screen.dart';
import '/core/utils/firebase_services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/core/services/snack_bar.dart';
import '/core/validations/validations.dart';
import '/modules/sign_in_screen/widget/word_divider_widget.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_button.dart';
import '/core/widget/custom_text_form_field.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign-in';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo,
              ),
              0.03.horSpace,
              CustomTextFormField(
                validator: (value) {
                  return Validations.isEmailValid(emailController.text);
                },
                controller: emailController,
                hintText: 'Email',
              ),
              0.02.horSpace,
              CustomTextFormField(
                isPassword: true,
                hintText: 'Password',
                controller: passwordController,
                validator: (value) {
                  return Validations.isPasswordValid(passwordController.text);
                },
              ),
              CustomTextButton(
                text: 'Forget Password?',
                callBack: () {},
              ).centerRightWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 0.065.height,
                    child: CustomElevatedButton(
                      text: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      callBack: () async {
                        EasyLoading.show();
                        if (key.currentState!.validate()) {
                          UserCredential? user = await FirebaseServices.signIn(
                                  emailController.text, passwordController.text)
                              .then((v) {
                            EasyLoading.dismiss();
                          });
                          if (user != null) {
                            SnackBarService.showSuccessMessage(
                                'Login Successfully');
                          } else {
                            SnackBarService.showErrorMessage('Login Failed');
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t Have Account ? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                  CustomTextButton(
                    text: 'Create Account',
                    textStyle: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decorationColor: AppColors.secondary,
                    ),
                    callBack: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                  ),
                ],
              ),
              WordDividerWidget(
                text: 'Or',
              ),
              0.03.horSpace,
              SizedBox(
                height: 0.07.height,
                child: CustomElevatedButton(
                  callBack: () {},
                  backgroundColor: AppColors.primary,
                  borderRadius: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.google,
                        height: 26,
                        width: 26,
                      ),
                      0.02.verSpace,
                      Text(
                        'Login With Google',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).centerWidget().verPadding(0.035),
        ),
      ),
    );
  }
}
