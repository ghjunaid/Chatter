import 'package:chatter/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String username,
    required String email,
    required String token,
  }) : super(id: id, username: username, email: email, token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] != null ? json['id'] as String : '',
      username: json['username'] != null ? json['username'] as String : '',
      email: json['email'] != null ? json['email'] as String : '',
      token: json['token'] != null ? json['token'] as String : '',
    );
  }
}
