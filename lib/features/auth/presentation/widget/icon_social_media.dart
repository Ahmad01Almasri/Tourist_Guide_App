import 'package:flutter/material.dart';

class IconSocialMedia extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;
  const IconSocialMedia({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 80,
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
              // color: Colors.purple,
            )),
      ),
    );
  }
}
