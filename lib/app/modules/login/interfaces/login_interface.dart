import '../models/_export_model.dart';

abstract interface class LoginInterface {
  Future<LoginModel?> fetchLogin({
    required LoginModel loginModel,
    required String username,
    required String password,
  });
}
