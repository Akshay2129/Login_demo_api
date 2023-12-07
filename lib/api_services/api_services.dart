import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_demo_api/models/login_model.dart';

class ApiServices {
  String baseUrl = "https://reqres.in";

  Future<LoginModel?> userLogIn(String email, String password) async {
    var response = await http.post(Uri.parse('$baseUrl/api/login'),
        body: {"email": email, "password": password});

    if (response.statusCode == 200) {
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
      return loginModel;
    }
    return null;
  }
}
