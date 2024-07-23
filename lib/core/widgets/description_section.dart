import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 230, top: 20),
          child: Text(
            AppStrings.description,
            style: AppTextStyles.poppinsW500style16
                .copyWith(fontSize: 20, color: AppColors.primaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "hdfhsf sjfbjsfs fsjf skdsjfh shfuis shui sfu ssiuf guisfg sgfsgsdgs gfiusguisgfiusguigui  sf iusgfiusg uiuis gfuisgfiu sius gfiu gfius guisgiusfgius giusgf ui g jf kjs fkjs fkjs fkjsjfsjfbjsgfjks gksg jsbgkjs gkjs dgjkd kgj sdkjg sd gkjsd gkjd gkjsdkjg kdg kds gkjds gkjdsf gkjsdf g dgkjs dgkjs dkjg sdkjg ksdg jsdg kjds gkjds gkjds gjds gkjds gkjds gj :",
            style: AppTextStyles.poppinsW500style16.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
