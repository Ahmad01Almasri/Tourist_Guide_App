import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/functions/save_user_name.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/snackbar_message.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';
import '../widgets/button_app.dart';
import '../widgets/row_icon_social_media.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key, this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final userNameController = TextEditingController();
  final confirmTextController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  static String? email(String? value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if ((value ?? '').isEmpty || !emailRegex.hasMatch(value!))
      return AppStrings.invalidEmail;
    return null;
  }

  @override
  void dispose() {
    passwordTextController.dispose();
    confirmTextController.dispose();
    emailTextController.dispose();
    userNameController.dispose();
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
                  Image.asset(AppAssets.logoApp, height: 200),
                  Text(AppStrings.appName,
                      style: AppTextStyles.poppins600style40),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    hinttext: AppStrings.emailAddress,
                    mycontroller: emailTextController,
                    validator: (text) {
                      // if (text!.length < 3) {
                      //   return AppStrings.lessThanThree;
                      // } else if (text.isEmpty) {
                      //   return AppStrings.empty;
                      // } else if (text.length > 20) {
                      //   return AppStrings.moreThanTwenty;
                      // }
                      // return null;
                      return email(text);
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    hinttext: AppStrings.userName,
                    mycontroller: userNameController,
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
                  const SizedBox(height: 15),
                  CustomTextForm(
                    hinttext: AppStrings.password,
                    mycontroller: passwordTextController,
                    validator: (text) {
                      if (text!.length < 8) {
                        return AppStrings.lessThanEight;
                      } else if (text.isEmpty) {
                        return AppStrings.empty;
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    hinttext: AppStrings.confirmPassword,
                    mycontroller: confirmTextController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return AppStrings.empty;
                      } else if (passwordTextController.text !=
                          confirmTextController.text) {
                        return AppStrings.notTrue;
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  CustomButtonAuth(
                    title: AppStrings.signUp,
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        saveUserName(userNameController.text);
                        final user = User(
                          email: emailTextController.text,
                          username: userNameController.text,
                          password: passwordTextController.text,
                        );
                        context
                            .read<UserBloc>()
                            .add(SignUpUserEvent(user: user));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.alreadyHaveAnAccount,
                        style: AppTextStyles.poppinsw600style14
                            .copyWith(color: AppColors.black),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => customReplacementNavigate(
                            context, AppNamePage.signInPage),
                        child: Text(
                          AppStrings.loginNow,
                          style: AppTextStyles.poppinsW500style15,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: RowIconsSocialMedia(),
                  ),
                  BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is SuccsessUserState) {
                        print("ttttttttttttttttttttttttt");
                        SnackBarMessage().showSuccessSnackBar(
                            message: state.message, context: context);
                        SharedPreferencesService.isAuth();

                        customReplacementNavigate(
                            context, AppNamePage.citySelectionPage);
                      } else if (state is ErrorUserState) {
                        print("eeeeeeeeeeeeeeeeeeeeee");
                        SnackBarMessage().showErrorSnackBar(
                            message: state.message, context: context);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingUserState) {
                        print("llllllllllllllllllllllllll");
                        return LoadingWidget();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
