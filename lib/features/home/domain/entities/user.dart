import 'package:flutter_super/flutter_super.dart';
import '../../data/models/user_model.dart';

class UserEntity with SuperModel {
  final String username;
  final String email;
  final String habitsCompleted;

  const UserEntity({required this.username, required this.email, required this.habitsCompleted});

  factory UserEntity.fromModel(
      UserModel entity) {
    return UserEntity(
      username: entity.username,
      email: entity.email,
      habitsCompleted: entity.habitsCompleted,
    );
  }

  @override
  List<Object?> get props => [username, email, habitsCompleted];
}