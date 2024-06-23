import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final bool? obscureText;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final String? Function(String?)? validator;
  const CustomTextForm(
      {super.key,
      required this.hinttext,
      required this.mycontroller,
      this.obscureText,
      this.validator,
      this.readOnly,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ?? () {},
      readOnly: readOnly ?? false,
      cursorColor: AppColors.primaryColor,
      style: AppTextStyles.poppinsW500style16.copyWith(color: AppColors.black),
      validator: validator,
      controller: mycontroller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: AppColors.red)),
          errorStyle: AppTextStyles.poppins600style12,
          hintText: hinttext,
          hintStyle: AppTextStyles.poppinsW500style16,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: AppColors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 4)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(50),
          )),
    );
  }
}
