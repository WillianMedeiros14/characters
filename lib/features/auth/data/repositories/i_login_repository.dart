import 'package:alura_quest/features/auth/data/model/login_model.dart';

abstract class ILoginRepository {
  Future login({required LoginModel dataLogin});
}
