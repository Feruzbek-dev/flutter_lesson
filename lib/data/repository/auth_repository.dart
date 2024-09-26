import 'package:dio/dio.dart';
import 'package:exercise/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final Dio dio = Dio();

  Future<String> login({required String phone, required String code}) async {
    final Response response =
        await dio.post('https://api.probox.uz/api/v1/clients/send-code', data: {
      "phone": phone,
      "mobile_code": code,
    });
    return response.data['data']['token'];
  }



  Future<void> login2(
      {required String login, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Response response = await dio.post(
      'https://dummyjson.com/auth/login',
      data: {
        "username": login,
        "password": password,
      },
      options: Options(headers: {'Content-Type': "application/json"}),
    );
    final UserModel user = UserModel.fromJson(response.data);
    prefs.setString("token", user.token ?? "");

  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Response response = await dio.get('https://dummyjson.com/auth/me',
        options: Options(
            headers: {"Authorization": 'Bearer ${prefs.getString('token')}'}));
    return UserModel.fromJson(response.data);
  }
}
