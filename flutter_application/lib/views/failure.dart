import 'package:flutter/material.dart';

class Failure extends StatelessWidget {
  final String message; // 👈 mensaje dinámico para mostrar el error

  const Failure({super.key, this.message = "Ocurrió un error"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // 👈 Aquí puedes volver a intentar la acción que falló
              Navigator.of(context).pop();
            },
            child: const Text("Reintentar"),
          ),
        ],
      ),
    );
  }
}
