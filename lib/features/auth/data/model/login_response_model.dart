import 'package:alura_quest/shared/model/user_model.dart';

class LoginResponseModel {
  late String token;
  final UserModel user;

  LoginResponseModel({
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'],
      user: UserModel.fromMap(map['user']),
    );
  }
}
