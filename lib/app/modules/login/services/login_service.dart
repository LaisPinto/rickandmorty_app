import 'package:rm_app/app/modules/login/interfaces/_export_interface.dart';
import '../../core/contants/_export_constant.dart';
import '../../core/network/_export_network.dart';
import '../models/_export_model.dart';
import '_export_service.dart';

class LoginService implements LoginInterface {
  @override
  Future<LoginModel?> fetchLogin({
    required LoginModel loginModel,
    required String username,
    required String password,
  }) async {
    String url = AppConstant.loginURL;
    try {
      final response = await Network.internal().post(
        url: url,
        headers: LoginModelHeader.getLoginHeaders(),
        body: LoginModel.body(loginModel: loginModel),
      );
      if (response == null) {
        return null;
      } else {
        LoginModel loginModelResponse = LoginModel.fromMap(response);
        return loginModelResponse;
      }
    } catch (error) {
      rethrow;
    }
  }
}