import 'package:flutter/material.dart';
import 'package:flutter_application/features/tareas/logic/tarea_cubit.dart';
import 'package:flutter_application/views/failure.dart';
import 'package:flutter_application/views/loading.dart';
import 'package:flutter_application/views/success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/user/logic/user_cubit.dart';

void main() => runApp(const HomeView());

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Usuario')),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 800,
              height: 200,
              margin: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 7, 62, 104),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        return Success();
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
            Text("Tareas", style: TextStyle(color: Colors.black, fontSize: 18)),
            BlocBuilder<TareaCubit, TareaState>(
              builder: (context, state) {
                if (state is TareaInitial || state is TareaLoading) {
                  return Container(
                    width: 600,
                    height: 200,
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 70, 99, 186),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Loading(),
                  );
                } else if (state is TareaSuccess) {
                  return Container(
                    width: 600,
                    height: 200,
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 70, 99, 186),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Success(),
                  );
                } else if (state is TareaLoaded) {
                  final tareas = state.tareas;

                  return Column(
                    children: tareas.map((tarea) {
                      return Container(
                        width: 600,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 70, 99, 186),
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
