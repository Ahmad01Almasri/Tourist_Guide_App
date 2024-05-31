import 'package:flutter/material.dart';

import 'icon_social_media.dart';

class RowIconsSocialMedia extends StatelessWidget {
  const RowIconsSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconSocialMedia(
          onTap: () {},
          icon: Icons.facebook,
        ),
        IconSocialMedia(
          onTap: () {},
          icon: Icons.telegram,
        )
      ],
    );
  }
}
