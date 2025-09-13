class Car {
  String modelo;
  String marca;
  String color;
  String descripcion;

  Car({
    required this.modelo,
    required this.marca,
    required this.color,
    required this.descripcion,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      modelo: json['modelo'],
      marca: json['marca'],
      color: json['color'],
      descripcion: json['descripcion'],
    );
  }
}
