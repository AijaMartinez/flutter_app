import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class UserService {
  final String baseUrl =
      "https://raw.githubusercontent.com/AijaMartinez/flutter_app/main/infoUser.json";

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al obtener usuario");
    }
  }
}
