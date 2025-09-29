import 'dart:convert';

import 'package:chatter/features/chat/data/models/message_model.dart';
import 'package:chatter/features/chat/domain/entities/message_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class MessageRemoteDataSource {
  final String baseUrl = 'http://10.0.2.2:6000';
  final _storage = FlutterSecureStorage();

  Future<List<MessageEntity>> fetchMessages(String conversationId) async {
    String token = await _storage.read(key: 'token') ?? '';
    final url = Uri.parse('$baseUrl/messages/$conversationId');
    print('Fetching messages for conversationId: $conversationId');
    print('Request URL: $url');
    print('Token present: ${token.isNotEmpty}');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print('Response statusCode: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => MessageModel.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to fetch Message: ${response.statusCode} - ${response.body}',
      );
    }
  }
}
