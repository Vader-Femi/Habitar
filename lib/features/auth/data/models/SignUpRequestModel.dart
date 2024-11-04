import '../../domain/entities/SignUpRequestEntity.dart';

class SignUpRequestModel extends SignUpRequestEntity{

  const SignUpRequestModel({
    required String name,
    required String email,
    required String password,
}): super(
    name: name,
    email: email,
    password: password
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
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