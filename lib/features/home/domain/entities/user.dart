import '../../data/models/user_model.dart';

class UserEntity {
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
}