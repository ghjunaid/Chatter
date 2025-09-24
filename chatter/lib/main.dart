import 'package:chatter/chat_page.dart';
import 'package:chatter/core/theme.dart';
import 'package:chatter/message_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
        );
  }
}

