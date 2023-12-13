// get_api.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_demo_api/models/users_details.dart';

class GetApiServices {
  static Future<UserDetailsModel?> getDetails() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/users"));
    if (response.statusCode == 200) {
      UserDetailsModel userDetailsModel =
          UserDetailsModel.fromJson(jsonDecode(response.body));
      return userDetailsModel;
    }
    return null;
  }
}
