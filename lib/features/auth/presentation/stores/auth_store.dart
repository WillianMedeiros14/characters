import 'package:alura_quest/features/auth/data/model/login_model.dart';
import 'package:alura_quest/features/auth/data/model/signUp_model.dart';
import 'package:alura_quest/features/auth/data/repositories/auth_repository.dart';
import 'package:alura_quest/shared/model/user_model.dart';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthRepository authRepository;

  _AuthStore({required this.authRepository}) {
    verifyToken();
  }

  @observable
  UserModel? user;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingToken = true;

  @observable
  bool isLogged = false;

  @action
  Future login(LoginModel dataLogin) async {
    isLoading = true;
    final result = await authRepository.login(dataLogin: dataLogin);
    isLoading = false;
    if (result != null) {
      bool isValueSavedToken = await saveTokenFromResponse(
          token: result.token, userName: result.user.userName);
      user = result.user;

      if (isValueSavedToken) {
        isLogged = true;
      }

      return true;
    } else {
      print("Erro ao fazer login");
    }
  }

  @action
  Future signUp(SignUpModel dataSignUp) async {
    isLoading = true;
    final result = await authRepository.signUp(dataSignUp: dataSignUp);
    isLoading = false;
    if (result != null) {
      bool isValueSavedToken = await saveTokenFromResponse(
          token: result.token, userName: result.user.userName);

      user = result.user;

      if (isValueSavedToken) {
        isLogged = true;
      }

      return true;
    } else {
      print("Erro ao criar usuário");
      return false;
    }
  }

  @action
  Future<bool> saveTokenFromResponse(
      {required String token, required String userName}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      bool successAaccessToken =
          await sharedPreferences.setString("accessToken", token);
      bool successUserName =
          await sharedPreferences.setString("userName", userName);

      if (successAaccessToken && successUserName) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Erro ao tentar salvar o token: $e");
      return false;
    }
  }

  @action
  Future<void> logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("accessToken");
    await sharedPreferences.remove("userName");
    isLogged = false;
  }

  @action
  Future verifyToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('accessToken');
    String? userName = sharedPreferences.getString('userName');

    if (token != null && userName != null) {
      isLogged = true;

      user = UserModel(id: "", userName: userName, email: "email");
    } else {
      isLogged = false;
    }

    isLoadingToken = false;
  }
}
