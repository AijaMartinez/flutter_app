class User {
  String email;
  String nombre;
  String saldo;

  User({required this.email, required this.nombre, required this.saldo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      nombre: json['nombre'],
      saldo: json['saldo'],
    );
  }
}
