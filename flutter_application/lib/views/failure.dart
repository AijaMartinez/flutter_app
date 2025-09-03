import 'package:flutter/material.dart';
import 'package:flutter_application/features/user/data/user_service.dart';
import 'package:flutter_application/features/user/logic/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              context.read<UserCubit>().getUser();
            },
            child: const Text("Reintentar"),
          ),
        ],
      ),
    );
  }
}
