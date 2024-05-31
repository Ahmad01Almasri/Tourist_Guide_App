import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/button_app.dart';
import '../widgets/row_icon_social_media.dart';
import '../widgets/text_field.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final confirmTextController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  void dispose() {
    passwordTextController.dispose();
    confirmTextController.dispose();
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formstate,
              child: Column(
                children: [
                  Image.asset(Assets.logoApp, height: 200),
                  Text(AppStrings.appName,
                      style: AppTextStyles.poppins600style40),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextForm(
                    hinttext: AppStrings.emailAddress,
                    mycontroller: emailTextController,
                    validator: (text) {
                      if (text!.length < 3) {
                        return AppStrings.lessThanThree;
                      } else if (text.isEmpty) {
                        return AppStrings.empty;
                      } else if (text.length > 20) {
                        return AppStrings.moreThanTwenty;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(
                      hinttext: AppStrings.password,
                      mycontroller: passwordTextController,
                      validator: (text) {
                        if (text!.length < 8) {
                          return AppStrings.lessThanEight;
                        } else if (text.length > 8) {
                          return AppStrings.moreThanEight;
                        } else if (text.isEmpty) {
                          return AppStrings.empty;
                        }
                        return null;
                      },
                      obscureText: true),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(
                      hinttext: AppStrings.confirmPassword,
                      mycontroller: confirmTextController,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return AppStrings.empty;
                        } else if (confirmTextController !=
                            passwordTextController) {
                          return AppStrings.notTrue;
                        }
                        return null;
                      },
                      obscureText: true),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonAuth(
                    title: AppStrings.signUp,
                    onPressed: () {
                      if (formstate.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.alreadyHaveAnAccount,
                        style: AppTextStyles.poppinsw600style14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () =>
                            customReplacementNavigate(context, "/signIn"),
                        child: Text(
                          AppStrings.loginNow,
                          style: AppTextStyles.poppins500style18,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: RowIconsSocialMedia(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int i = 2;
