import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {super.key, required this.text, required this.isFromUser});
  final String text;
  final bool isFromUser;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Container(
          constraints: const BoxConstraints(minWidth: 520),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: isFromUser ? AppColors.primaryColor : AppColors.purple),
          child: Column(
            children: [MarkdownBody(data: text)],
          ),
        ))
      ],
    );
  }
}
