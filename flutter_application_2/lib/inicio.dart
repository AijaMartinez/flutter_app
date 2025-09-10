import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/bloc/info_bloc.dart';
import 'package:flutter_application_2/infocar.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InfoBloc, InfoState>(
      listener: (context, state) {
        if (state is NavigateToInfoCar) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const InfoCar()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Inicio")),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 155, 162, 168),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text("Nombre"),
                      const TextField(),
                      const Padding(padding: EdgeInsets.all(20)),
                      const Text("Contraseña"),
                      const TextField(),
                      ElevatedButton(
                        onPressed: () {
                          context.read<InfoBloc>().add(GoToInfoCar());
                        },
                        child: const Text("Ir"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
