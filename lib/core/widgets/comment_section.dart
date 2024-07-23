import 'package:flutter/material.dart';

import '../utils/app_strings.dart';
import 'custom_text_field.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Expanded(
              child: CustomTextForm(
                  hinttext: AppStrings.writeSomethingHere,
                  mycontroller: textController,
                  obscureText: false)),
          IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.arrow_circle_up))
        ],
      ),
    );
  }
}
