import 'package:evently/core/utils/firebase_services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/validations/validations.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  static const routeName = '/forget-password';

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var key = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.forgetPassword).allPadding(20),
                0.01.height.verSpace,
                CustomTextFormField(
                  validator: (value) {
                    return Validations.isEmailValid(emailController.text);
                  },
                  controller: emailController,
                  hintText: 'Email',
                ).verPadding(0.02),
                0.01.height.verSpace,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomElevatedButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    borderRadius: 16,
                    callBack: () {
                      if (key.currentState!.validate()) {
                        EasyLoading.show();
                        FirebaseAuthServices.forgetPassword(emailController.text);
                        EasyLoading.dismiss();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ).centerWidget(),
          ),
        ),
      ),
    );
  }
}
