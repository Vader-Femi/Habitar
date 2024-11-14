import '../../domain/entities/SignUpRequestEntity.dart';

class SignUpRequestModel extends SignUpRequestEntity{

  const SignUpRequestModel({
    required super.name,
    required super.email,
    required super.password,
});

  Map<String, dynamic> toJson() {
    return {
      'username': name,
      'email': email,
      'password': password,
    };
  }


  factory SignUpRequestModel.fromEntity(
      SignUpRequestEntity entity) {
    return SignUpRequestModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
    );
  }

}