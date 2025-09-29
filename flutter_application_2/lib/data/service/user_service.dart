import 'dart:convert';

import 'package:flutter_application_2/data/model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl =
      "https://raw.githubusercontent.com/AijaMartinez/flutter_app/refs/heads/main/infoUser.json";

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al obtener usuario");
    }
  }
}
