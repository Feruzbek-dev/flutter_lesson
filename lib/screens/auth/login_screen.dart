import 'package:dio/dio.dart';
import 'package:exercise/data/repository/auth_repository.dart';
import 'package:exercise/screens/auth/confirmation_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final AuthRepository _repository = AuthRepository();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _controller,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  final String token = await _repository.login(
                      phone: _controller.text, code: '0000');
                  print(token);
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ConfirmationScreen(
                            token: token,
                            phoneNumber: _controller.text,
                          )));
                } on DioException catch (e) {
                  setState(() {
                    _isLoading = false;
                  });
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Text(
                          e.response?.data.toString() ?? "Nimadur xato ketdi"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Ok"))
                      ],
                    ),
                  );
                }
              },
              child: _isLoading ? CircularProgressIndicator() : Text("Send"),
            ),
            SizedBox(height: 300,),
            Image.network('https://api.probox.uz/uploads/category/images/TyF9af4eeVk7pg97GbVgy1WFcU_kGOS4.png',)
          ],
        ),
      ),
    );
  }
}
