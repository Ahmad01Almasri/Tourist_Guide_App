import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../functions/select_city_dialog.dart';
import '../functions/selected_city.dart';
import 'notifications_container.dart';

class TopRowHomeSection extends StatelessWidget {
  const TopRowHomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatefulBuilder(
            builder: (context, mysetState) => Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.black,
                  size: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  getCityName(),
                  style: AppTextStyles.poppinsBoldstyle24,
                ),
                IconButton(
                    onPressed: () async {
                      String? result = await selectCityDialog(
                          context); // Wait for dialog result

                      if (result != null) {
                        mysetState(() {
                          saveCityName();
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 30,
                    ))
              ],
            ),
          ),
          const ContainerNotifications()
        ],
      ),
    );
  }
}
