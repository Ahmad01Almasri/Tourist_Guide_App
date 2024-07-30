import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:tourist_guide/core/widgets/custom_button_app.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  void Function() onPressed;
  MessageDisplayWidget({
    super.key,
    required this.onPressed,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              message,
              style: AppTextStyles.poppinsBoldstyle24
                  .copyWith(color: AppColors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Icon(
              Icons.wifi_off,
              color: AppColors.red,
              size: 60,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButtonApp(
              color: AppColors.red,
              text: "Refrech",
              onPressed: onPressed,
            )
          ],
        ),
      )),
    );
  }
}
