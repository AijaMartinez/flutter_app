import 'package:flutter/material.dart';
import 'package:flutter_application/features/tareas/logic/tarea_cubit.dart';
import 'package:flutter_application/core/views/failure.dart';
import 'package:flutter_application/core/views/loading.dart';
import 'package:flutter_application/core/views/success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/user/logic/user_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuario')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 62, 104),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserInitial) {
                        return const Text(
                          "Esperando datos...",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        );
                      } else if (state is UserLoading) {
                        return const Center(child: Loading());
                      } else if (state is UserSuccess) {
                        return const Success();
                      } else if (state is UserLoaded) {
                        final user = state.user;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Hola, ${user.nombre}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Contacto:  ${user.email}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Saldo: ${user.saldo}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      } else if (state is UserError) {
                        return const Center(child: Failure());
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            const Text(
              "Tareas",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 8),
            BlocBuilder<TareaCubit, TareaState>(
              builder: (context, state) {
                if (state is TareaInitial || state is TareaLoading) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 70, 99, 186),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Loading(),
                  );
                } else if (state is TareaSuccess) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 70, 99, 186),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Success(),
                  );
                } else if (state is TareaLoaded) {
                  final tareas = state.tareas;

                  return Column(
                    children: tareas.map((tarea) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 70, 99, 186),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tarea.titulo,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              tarea.descripcion,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                } else if (state is TareaError) {
                  return Failure(message: state.message);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
