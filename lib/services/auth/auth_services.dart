import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:enviro_car/main.dart';
import 'package:enviro_car/models/user_model.dart';

class AuthenticationServices {
  static String baseUrl = 'https://envirocar.org/api/dev';
  Future<dynamic> register(
      String username, String password, String mail) async {
    try {
      Response res = await Dio().post('$baseUrl/users', data: {
        "name": username,
        "mail": mail,
        "token": password,
        "acceptedPrivacy": true,
        "acceptedTerms": true
      });
      print(res.statusMessage);
      print(res);
    } catch (e) {
      print("Something Went Wring");
      return e;
    }
  }

  Future<dynamic> login(String username, String password) async {
    BaseOptions option = BaseOptions(sendTimeout: 20);
    try {
      Response res = await Dio(option).get('$baseUrl/users/$username',
          options: Options(headers: {
            'X-User': username,
            'X-Token': password,
          }));
      if (res.statusCode == 200) {
        User user = User.fromJson(res.data);
        userBox.put('user', user);
        final userFromHive = userBox.get('user') as User;
        return userFromHive;
      } else {
        throw Exception(res.statusMessage);
      }
    } on DioError catch (e) {
      print(e.type.toString());
      String errorMessage = jsonDecode(e.response.toString())['message'];
      throw Exception(errorMessage);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  User getCurrentUser() {
    return userBox.get('user') as User;
  }

  Future<void> signOut() async {
    await userBox.clear();
  }
}
