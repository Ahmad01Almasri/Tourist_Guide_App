import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';

class IconSocialMedia extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;
  const IconSocialMedia({super.key, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 80,
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: Icon(
              icon,
              color: AppColors.white,
              size: 35,
            )),
      ),
    );
  }
}
