import 'package:chatter/features/chat/data/datasources/message_remote_data_source.dart';
import 'package:chatter/features/chat/domain/entities/message_entity.dart';
import 'package:chatter/features/chat/domain/repositories/message_repository.dart';

class MessagesRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource remoteDataSource;

  MessagesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MessageEntity>> fetchMessage(String conversationId) async {
    return await remoteDataSource.fetchMessages(conversationId);
  }

  @override
  Future<void> sendMessage(MessageEntity message) {
    throw UnimplementedError();
  }

}