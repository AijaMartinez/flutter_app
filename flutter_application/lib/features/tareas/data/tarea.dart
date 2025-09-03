class Tarea {
  final List<TareaElement> tareas;

  Tarea({required this.tareas});

  factory Tarea.fromJson(Map<String, dynamic> json) {
    var list = json['tareas'] as List;
    List<TareaElement> tareasList = list
        .map((e) => TareaElement.fromJson(e))
        .toList();
    return Tarea(tareas: tareasList);
  }
}

class TareaElement {
  final String titulo;
  final String descripcion;

  TareaElement({required this.titulo, required this.descripcion});

  factory TareaElement.fromJson(Map<String, dynamic> json) {
    return TareaElement(
      titulo: json['titulo'],
      descripcion: json['descripcion'],
    );
  }
}
