import 'package:mobx/mobx.dart';
import 'package:rm_app/app/modules/login/_export_login.dart';

part 'login_store.g.dart';

class LoginStore = BaseLoginStore with _$LoginStore;

abstract class BaseLoginStore with Store {
  LoginInterface loginInterface = LoginService();
  BaseLoginStore();

  @observable
  LoginModel? loginModel;

  @observable
  bool isLoading = false;

  @observable
  bool isPasswordVisible = false;

  @action
  Future<bool> getLogin({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    try {
      loginModel = LoginModel(
        username: username,
        password: password,
      );
      loginModel = await loginInterface.fetchLogin(
        loginModel: loginModel!,
        username: username,
        password: password);
      if(loginModel != null) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}