import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/bloc/info_bloc.dart';
import 'package:flutter_application_2/infocar.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _cedulaController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _cedulaController.dispose();
    super.dispose();
  }

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
          appBar: AppBar(
            title: const Text("Inicio"),
            centerTitle: true,
            backgroundColor: Colors.grey[800],
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Nombre",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                        hintText: "Escribe tu nombre",
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingresa tu nombre";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Cédula",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _cedulaController,
                      decoration: const InputDecoration(
                        hintText: "Escribe tu cédula",
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese tu cédula";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<InfoBloc>().add(FetchCarInfo());
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const InfoCar()),
                            );
                          }
                        },
                        label: const Text("Ir"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
