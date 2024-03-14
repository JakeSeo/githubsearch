import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth/info.dart';
import '../utils.dart';

class AuthRepository {
  Future<bool> saveAuthInfo({required AuthInfo auth}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final success = await sharedPreferences.setString(
      Utils.authInfoKey,
      jsonEncode(auth.toJson()),
    );
    return success;
  }

  Future<AuthInfo?> getAuthInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final authJsonString = sharedPreferences.getString(Utils.authInfoKey);
    if (authJsonString == null) return null;
    final authJson = jsonDecode(authJsonString);
    return AuthInfo.fromJson(authJson);
  }

  Future<bool> removeAuthInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.remove(Utils.authInfoKey);
  }
}
