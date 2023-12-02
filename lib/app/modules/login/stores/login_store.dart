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
      print("Iniciando o login para $username");

      // Adicionando verificação de campos vazios
      if (username.isEmpty || password.isEmpty) {
        print("Nome de usuário ou senha vazios");
        return false;
      }

      loginModel = LoginModel(
        username: username,
        password: password,
      );

      print("Chamando fetchLogin");
      loginModel = await loginInterface.fetchLogin(
        loginModel: loginModel!,
        username: username,
        password: password,
      );

      print("Resultado do fetchLogin: $loginModel");

      if (loginModel != null) {
        return true;
      }

      return false;
    } catch (error) {
      print("Erro durante o login: $error");
      return false;
    } finally {
      isLoading = false;
      print("Finalizando o login");
    }
  }
}
