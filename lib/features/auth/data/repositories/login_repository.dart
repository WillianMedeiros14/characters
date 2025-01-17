import 'package:alura_quest/features/auth/data/model/login_model.dart';
import 'package:alura_quest/features/auth/data/model/login_response_model.dart';
import 'package:alura_quest/features/auth/data/repositories/i_login_repository.dart';

import 'package:alura_quest/shared/data/dio/dio_client_http.dart';

class LoginRepository implements ILoginRepository {
  final IHttpCharacterClient client;

  LoginRepository({
    required this.client,
  });

  @override
  Future<LoginResponseModel?> login({required LoginModel dataLogin}) async {
    final response = await client.login(
      endpoint: "/User/login",
      data: dataLogin.toJson(),
    );

    if (response.statusCode == 200) {
      final body = response.data;

      final LoginResponseModel dataLoginResponse = LoginResponseModel.fromMap(
        body,
      );
      print("User fromMap");
      print(body);
      return dataLoginResponse;
    } else if (response.statusCode == 404) {
      print(response);
      return null;
    } else {
      print(response);
      return null;
    }
  }
}
