import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rm_app/app/modules/login/stores/login_store.dart';

import '../../home/_export_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late LoginStore _loginStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Container(
                width: 1009,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white),
                ),
                child: Image.asset('assets/RickAndMorty.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Observer(
              builder: (context) {
                if (_loginStore.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: TextFormField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                              width: 2,
                                            ),
                                          ),
                                          hintText: "Email",
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 2,
                                              ))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: _loginStore.isPasswordVisible,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                              width: 2,
                                            ),
                                          ),
                                          hintText: "senha",
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                              color: Colors.green,
                                              width: 2,
                                            ),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _loginStore.isPasswordVisible ? MdiIcons.eyeOff : MdiIcons.eye,
                                              color: Colors.green,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _loginStore.isPasswordVisible = !_loginStore.isPasswordVisible;
                                              });
                                            },
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              child: SizedBox(
                                height: 40,
                                width: double.maxFinite,
                                child: FilledButton(
                                  onPressed: () async {
                                    _pushHome();
                                  },
                                  style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                                  child: const Text(
                                    "Entrar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _initPage() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _loginStore = LoginStore();
  }

  void _disposeControllers() {
    _usernameController.dispose();
    _passwordController.dispose();
  }

  void _pushHome() {
    print("Pushing to home page");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }
}
