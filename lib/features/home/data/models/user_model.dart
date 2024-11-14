import '../../domain/entities/user.dart';

class UserModel extends UserEntity{

  const UserModel({
    required super.username,
    required super.email,
    required super.habitsCompleted,
});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'habits_completed': habitsCompleted,
    };
  }

  UserModel copyWith(
      {String? username, String? email, String? habitsCompleted}) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      habitsCompleted: habitsCompleted ?? this.habitsCompleted,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"],
      email: json["email"],
      habitsCompleted: json["habits_completed"],
    );
  }


  factory UserModel.fromEntity(
      UserEntity entity) {
    return UserModel(
      username: entity.username,
      email: entity.email,
      habitsCompleted: entity.habitsCompleted,
    );
  }

}