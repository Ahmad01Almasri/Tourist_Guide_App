// // import 'package:flutter/material.dart';
// // import 'package:google_generative_ai/google_generative_ai.dart';
// // import 'package:http/http.dart';
// // import 'package:tourist_guide/core/utils/app_colors.dart';
// // import 'package:tourist_guide/features/ai%20chat/presentation/widgets/message_widget.dart';

// // class AiChatPagState extends StatefulWidget {
// //   const AiChatPagState({super.key});

// //   @override
// //   State<AiChatPagState> createState() => _AiChatPagStateState();
// // }

// // class _AiChatPagStateState extends State<AiChatPagState> {
// //   late final GenerativeModel _model;
// //   late final ChatSession _chatSession;
// //   final FocusNode _textFieldFocus = FocusNode();
// //   final TextEditingController _textController = TextEditingController();
// //   final ScrollController _scrollController = ScrollController();
// //   bool _loading = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeChatModel();
// //   }

// //   void _initializeChatModel() {
// //     const apiKey = 'AIzaSyAuGXXMvbU5jKkeTVrjdD3iuWOMFPzDc8I';
// //     _model = GenerativeModel(
// //       model: 'gemini-pro',
// //       apiKey: apiKey,
// //     );
// //     _chatSession = _model.startChat();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("AI Assest TouRist Guide"),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: _chatSession.history.length,
// //                 controller: _scrollController,
// //                 itemBuilder: (context, index) {
// //                   final Content content = _chatSession.history.toList()[index];
// //                   final text = content.parts
// //                       .whereType<TextPart>()
// //                       .map<String>((e) => e.text)
// //                       .join('');
// //                   return MessageWidget(
// //                     text: text,
// //                     isFromUser: content.role == 'User',
// //                   );
// //                 },
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: TextField(
// //                       autofocus: true,
// //                       focusNode: _textFieldFocus,
// //                       decoration: _textFieldDecoration(),
// //                       controller: _textController,
// //                       onSubmitted: _sendChatMessage,
// //                     ),
// //                   ),
// //                   const SizedBox(
// //                     height: 15,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   InputDecoration _textFieldDecoration() {
// //     return InputDecoration(
// //       contentPadding: const EdgeInsets.all(15),
// //       hintText: 'أدخل نصاً',
// //       border: OutlineInputBorder(
// //         borderRadius: const BorderRadius.all(Radius.circular(14)),
// //         borderSide: BorderSide(color: AppColors.black),
// //       ),
// //       focusedBorder: OutlineInputBorder(
// //         borderRadius: const BorderRadius.all(Radius.circular(14)),
// //         borderSide: BorderSide(color: AppColors.black),
// //       ),
// //     );
// //   }

// //   Future<void> _sendChatMessage(String message) async {
// //     setState(() {
// //       _loading = true;
// //     });
// //     try {
// //       final response = await _chatSession.sendMessage(Content.text(message));
// //       final text = response.text;
// //       if (text == null) {
// //         _showError("لم يتم استلام رد");
// //         return;
// //       } else {
// //         setState(() {
// //           _loading = false;
// //           _scrollDown();
// //         });
// //       }
// //     } catch (e) {
// //       _showError(e.toString());
// //       setState(() {
// //         _loading = false;
// //       });
// //     } finally {
// //       _textController.clear();
// //       setState(() {
// //         _loading = false;
// //       });
// //       _textFieldFocus.requestFocus();
// //     }
// //   }

// //   void _scrollDown() {
// //     WidgetsBinding.instance.addPostFrameCallback(
// //       (_) => _scrollController.animateTo(
// //         _scrollController.position.maxScrollExtent,
// //         duration: const Duration(milliseconds: 750),
// //         curve: Curves.easeOutCirc,
// //       ),
// //     );
// //   }

// //   void _showError(String message) {
// //     showDialog<void>(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text("حدث خطأ"),
// //           content: SingleChildScrollView(
// //             child: SelectableText(message),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text("حسنًا"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AiChatPage extends StatefulWidget {
//   const AiChatPage({super.key});

//   @override
//   State<AiChatPage> createState() => _AiChatPageState();
// }

// class _AiChatPageState extends State<AiChatPage> {
//   final TextEditingController _textController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   final List<Map<String, String>> _messages = [];
//   bool _loading = false;

//   Future<void> _sendMessage(String message) async {
//     setState(() {
//       _loading = true;
//       _messages.add({"role": "user", "content": message});
//     });

//     final response = await _fetchResponseFromOpenAI(message);

//     setState(() {
//       _loading = false;
//       if (response != null) {
//         _messages.add({"role": "assistant", "content": response});
//       }
//       _textController.clear();
//       _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent + 100,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     });
//   }

//   Future<String?> _fetchResponseFromOpenAI(String message) async {
//     const apiKey = 'YOUR_OPENAI_API_KEY_HERE';
//     final response = await http.post(
//       Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $apiKey',
//       },
//       body: jsonEncode({
//         'prompt': message,
//         'max_tokens': 150,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['choices'][0]['text'];
//     } else {
//       print('Failed to fetch response: ${response.statusCode}');
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AI Chat Assistant'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 controller: _scrollController,
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   final message = _messages[index];
//                   return ListTile(
//                     title: Align(
//                       alignment: message['role'] == 'user'
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: Container(
//                         padding: const EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                           color: message['role'] == 'user'
//                               ? Colors.blue[100]
//                               : Colors.grey[300],
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Text(message['content']!),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             if (_loading) const CircularProgressIndicator(),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _textController,
//                       decoration: const InputDecoration(
//                         hintText: 'أدخل رسالة',
//                         border: OutlineInputBorder(),
//                       ),
//                       onSubmitted: _sendMessage,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.send),
//                     onPressed: () => _sendMessage(_textController.text),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
