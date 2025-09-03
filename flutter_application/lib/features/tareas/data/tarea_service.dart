import 'dart:convert';
import 'package:http/http.dart' as http;
import 'tarea.dart';

class TareaService {
  final String baseUrl =
      "https://raw.githubusercontent.com/AijaMartinez/flutter_app/main/tareas.json";

  Future<List<TareaElement>> fetchTareas() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final tarea = Tarea.fromJson(data);
      return tarea.tareas;
    } else {
      throw Exception("Error al cargar tareas");
    }
  }
}
