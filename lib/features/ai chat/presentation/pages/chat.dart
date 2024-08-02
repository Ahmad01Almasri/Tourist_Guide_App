import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

class GeminiPage extends StatefulWidget {
  const GeminiPage({super.key});

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: '0', firstName: 'user');
  ChatUser geminiUser = ChatUser(id: '1', firstName: 'gemini');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            size: 30,
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
        title: Text(
          'SYRAVEL Bot , can I help you?',
          style: AppTextStyles.poppins400style20
              .copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      messageListOptions: MessageListOptions(
        dateSeparatorBuilder: (date) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Text(
              date.toLocal().toString().split(' ')[0],
              style: AppTextStyles.poppinsBoldstyle24
                  .copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
      messageOptions: MessageOptions(
        showTime: false, // إخفاء الوقت الافتراضي
        messageTextBuilder:
            (ChatMessage msg, ChatMessage? previousMsg, ChatMessage? nextMsg) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msg.text,
                  style: TextStyle(
                    color: msg.user.id == currentUser.id
                        ? AppColors.white
                        : AppColors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(DateFormat('HH :mm').format(msg.createdAt),
                    style: AppTextStyles.poppinsBoldstyle16
                        .copyWith(color: AppColors.black38, fontSize: 12)),
              ],
            ),
          );
        },
        messageDecorationBuilder:
            (ChatMessage msg, ChatMessage? previousMsg, ChatMessage? nextMsg) {
          bool isUser = msg.user.id == currentUser.id;
          return BoxDecoration(
            color: isUser ? AppColors.primaryColor : AppColors.black38,
            borderRadius: BorderRadius.circular(10.0),
          );
        },
      ),
      inputOptions: InputOptions(
        inputTextStyle:
            AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
        inputDecoration: InputDecoration(
          hintText: 'Type a message...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.offWhite,
          contentPadding: EdgeInsets.all(10.0),
        ),
        trailing: [
          IconButton(
            icon: Icon(Icons.image, color: AppColors.black),
            onPressed: _sendMediaMessage,
          ),
        ],
      ),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [File(chatMessage.medias!.first.url).readAsBytesSync()];
      }
      gemini.streamGenerateContent(question, images: images).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);

          String response = event.content?.parts
                  ?.fold('', (previous, current) => "$previous$currentUser") ??
              '';
          lastMessage.text = event.output!;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts
                  ?.fold('', (previous, current) => "$previous$currentUser") ??
              '';
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: event.output!);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (E) {
      print(E);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
          user: currentUser,
          createdAt: DateTime.now(),
          text: 'Do you want to know details about this thing?',
          // 'tell me what kind the chemical analyze is this and is this chemical analyze is sick or not and explain why ,translate the answer to arabic',

          medias: [
            ChatMedia(url: file.path, fileName: '', type: MediaType.image)
          ]);
      _sendMessage(chatMessage);
    }
  }
}
