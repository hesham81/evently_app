import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/core/extensions/extensions.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widget/custom_elevated_button.dart';
import 'package:evently/core/widget/custom_text_button.dart';
import 'package:evently/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign-up-screen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Image.asset(
            AppAssets.logo,
          ).centerWidget(),
          0.05.horSpace,
          CustomTextFormField(
            hintText: "Name",
            prefixIcon: ImageIcon(
              AssetImage(
                AppAssets.avatar,
              ),
              color: AppColors.greyColor,
            ).allPadding(10.2),
          ),
          0.02.horSpace,
          CustomTextFormField(
            hintText: "Email",
            prefixIcon: ImageIcon(
              AssetImage(
                AppAssets.email,
              ),
              color: AppColors.greyColor,
            ).allPadding(10.2),
          ),
          0.02.horSpace,
          CustomTextFormField(
            isPassword: true,
            hintText: "Password",
          ),
          0.02.horSpace,
          CustomTextFormField(
            isPassword: true,
            hintText: "Re-Password",
          ),
          0.02.horSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 0.065.height,
                child: CustomElevatedButton(
                  callBack: () {},
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
    );
  }
}
