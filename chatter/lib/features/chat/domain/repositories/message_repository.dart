import 'package:chatter/features/chat/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<List<MessageEntity>> fetchMessage(String conversationId);
  Future<void> sendMessage(MessageEntity message);
}
