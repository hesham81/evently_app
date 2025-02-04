import 'package:evently/core/utils/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/services/snack_bar.dart';
import '/core/validations/validations.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_button.dart';
import '/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up-screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Register",
          style: TextStyle(
            color: AppColors.titleBlackColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppAssets.logo,
              ).centerWidget(),
              0.05.horSpace,
              CustomTextFormField(
                controller: nameController,
                hintText: "Name",
                validator: (value) =>
                    Validations.isNameValid(nameController.text),
                prefixIcon: ImageIcon(
                  AssetImage(
                    AppAssets.avatar,
                  ),
                  color: AppColors.greyColor,
                ).allPadding(10.2),
              ),
              0.02.horSpace,
              CustomTextFormField(
                controller: emailController,
                hintText: "Email",
                validator: (value) =>
                    Validations.isEmailValid(emailController.text),
                prefixIcon: ImageIcon(
                  AssetImage(
                    AppAssets.email,
                  ),
                  color: AppColors.greyColor,
                ).allPadding(10.2),
              ),
              0.02.horSpace,
              CustomTextFormField(
                controller: passwordController,
                isPassword: true,
                hintText: "Password",
                validator: (value) =>
                    Validations.isPasswordValid(passwordController.text),
              ),
              0.02.horSpace,
              CustomTextFormField(
                controller: rePasswordController,
                isPassword: true,
                validator: (value) => Validations.rePasswordValid(
                    passwordController.text, rePasswordController.text),
                hintText: "Re-Password",
              ),
              0.02.horSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 0.065.height,
                    child: CustomElevatedButton(
                      callBack: () async {
                        if (formKey.currentState!.validate()) {
                          EasyLoading.show();
                          UserCredential? userCredential =
                              await FirebaseAuthServices.signUp(
                            password: passwordController.text,
                            email: emailController.text,
                            name: nameController.text,
                          ).then(
                            (value) {
                              EasyLoading.dismiss();
                            },
                          );
          
                          if (userCredential == null) {
                            SnackBarService.showSuccessMessage(
                                "Account Created Successfully");
                            Navigator.pop(context);
                          } else {
                            SnackBarService.showErrorMessage(
                                "Account Not Created");
                          }
                        }
                      },
                      text: Text(
                        "Create Account",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ).verPadding(0.02),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: AppColors.titleBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomTextButton(
                    text: "Login",
                    callBack: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ).verPadding(0.02),
        ),
      ),
    );
  }
}
