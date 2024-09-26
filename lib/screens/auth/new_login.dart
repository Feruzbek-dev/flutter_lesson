import 'package:dio/dio.dart';
import 'package:exercise/data/repository/auth_repository.dart';
import 'package:exercise/screens/user/user_screen.dart';
import 'package:flutter/material.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  late final TextEditingController _loginController;
  late final TextEditingController _passController;
  final AuthRepository _repository = AuthRepository();

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passController.dispose();
    _loginController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _loginController,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _passController,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _repository.login2(
                      login: _loginController.text,
                      password: _passController.text);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const UserScreen(),
                    ),
                  );
                } on DioException catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(e.response?.data.toString() ??
                                "Nimadur xato boldi"),
                          ));
                }
              },
              child: const Text("Log in"),
            )
          ],
        ),
      ),
    );
  }
}
