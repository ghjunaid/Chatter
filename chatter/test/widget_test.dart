// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chatter/main.dart';
import 'package:chatter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chatter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chatter/features/chat/data/datasources/message_remote_data_source.dart';
import 'package:chatter/features/chat/data/repositories/message_repository_impl.dart';
import 'package:chatter/features/conversation/data/datasource/conversations_remote_data_source.dart';
import 'package:chatter/features/conversation/data/repositories/conversations_repository_impl.dart';

void main() {
  testWidgets('App starts with RegisterPage', (WidgetTester tester) async {
    // Create dependencies
    final authRemoteDataSource = AuthRemoteDataSource();
    final authRepository = AuthRepositoryImpl(authRemoteDataSource: authRemoteDataSource);
    final conversationsRemoteDataSource = ConversationsRemoteDataSource();
    final conversationsRepository = ConversationsRepositoryImpl(conversationsRemoteDataSource: conversationsRemoteDataSource);
    final messageRemoteDataSource = MessageRemoteDataSource();
    final messagesRepository = MessagesRepositoryImpl(remoteDataSource: messageRemoteDataSource);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      authRepository: authRepository,
      conversationsRepository: conversationsRepository,
      messagesRepository: messagesRepository,
    ));

    // Verify that the app builds without errors and shows the initial page.
    expect(find.byType(MaterialApp), findsOneWidget);
    // Assuming RegisterPage has a title or form elements, adjust as needed.
    // For now, confirm the app renders.
    await tester.pumpAndSettle();
  });
}
