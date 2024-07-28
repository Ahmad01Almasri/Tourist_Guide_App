import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/snackbar_message.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';
import '../widgets/button_app.dart';
import '../widgets/row_icon_social_media.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  void dispose() {
    passwordTextController.dispose();

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
                  Image.asset(AppAssets.logoApp, height: 200),
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
                        } else if (text.length > 20) {
                          return AppStrings.moreThanTwenty;
                        } else if (text.isEmpty) {
                          return AppStrings.empty;
                        }
                        return null;
                      },
                      obscureText: true),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonAuth(
                    title: AppStrings.signIn,
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        final user2 = User2(
                          email: emailTextController.text,
                          password: passwordTextController.text,
                        );
                        context
                            .read<UserBloc>()
                            .add(LoginUserEvent(user2: user2));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAnAccount,
                        style: AppTextStyles.poppinsw600style14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () => customReplacementNavigate(
                            context, AppNamePage.signUpPage),
                        child: Text(
                          AppStrings.joinUsNow,
                          style: AppTextStyles.poppinsW500style15,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: RowIconsSocialMedia(),
                  ),
                  BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is SuccsessUserState) {
                        SnackBarMessage().showSuccessSnackBar(
                            message: state.message, context: context);

                        SharedPreferencesService.isAuth();

                        customReplacementNavigate(
                            context, AppNamePage.citySelectionPage);
                      } else if (state is ErrorUserState) {
                        SnackBarMessage().showErrorSnackBar(
                            message: state.message, context: context);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingUserState) {
                        return const LoadingWidget();
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
