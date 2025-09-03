import 'package:flutter/material.dart';
import 'package:flutter_application/views/failure.dart';
import 'package:flutter_application/views/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/user/logic/user_cubit.dart';

void main() => runApp(const HomeView());

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Inicio')),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 800,
              height: 200,
              margin: const EdgeInsets.all(8),
              color: Colors.amber,
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
                              "Contacto: , ${user.email}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Saldo: , ${user.saldo}",
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

                  /*                  Text(
                    "Hola, Carlos",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Contacto: carlos@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Saldo: 12000",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ), */
                ],
              ),
            ),
            Text("Tareas", style: TextStyle(color: Colors.black, fontSize: 18)),
            Container(
              width: 600,
              height: 200,
              margin: const EdgeInsets.all(8),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Comprar",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Ir al Ara",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
