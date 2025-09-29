class User {
  final String nombre;
  final String apellido;
  final String cedula;

  User({required this.nombre, required this.apellido, required this.cedula});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nombre: json['nombre'],
      apellido: json['apellido'],
      cedula: json['cedula'],
    );
  }
}
