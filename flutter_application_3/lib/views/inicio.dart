import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs/inicio_cubit/ini_form_cubit.dart';
import 'package:flutter_application_2/core/failure.dart';
import 'package:flutter_application_2/core/loading.dart';
import 'package:flutter_application_2/data/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/views/carro_desc.dart';
import 'package:flutter/services.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _cedulaController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _cedulaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IniFormCubit(userService: UserService()),
      child: BlocConsumer<IniFormCubit, IniFormState>(
        listener: (context, state) async {
          if (state is IniFormSuccess) {
            final user = await UserService().fetchUser();
            if (!context.mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DescripcionCarro(user: user)),
            );
          }
        },
        builder: (context, state) {
          if (state is IniFormLoading) {
            return Loading();
          } else if (state is IniFormFailure) {
            return Failure();
          }

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 146, 149, 151),
            appBar: AppBar(
              title: const Text("Inicio de Sesión"),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 54, 58, 58),
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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nombreController,
                        decoration: const InputDecoration(
                          hintText: "Escribe tu nombre",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 197, 199, 199),
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
                        "Apellido",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _apellidoController,
                        decoration: const InputDecoration(
                          hintText: "Escribe tu apellido",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 197, 199, 199),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su apellido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Cedula",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _cedulaController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          hintText: "Escribe tu cédula",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 197, 199, 199),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese tu cédula";
                          }
                          if (value.length != 10 && value.length != 8) {
                            return "Digite una cedula valida";
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
                              final cubit = context.read<IniFormCubit>();
                              cubit.sendData(
                                nombre: _nombreController.text.trim(),
                                apellido: _apellidoController.text.trim(),
                                cedula: _cedulaController.text.trim(),
                              );
                            }
                          },
                          label: const Text("Inicar Sesión"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              221,
                              27,
                              27,
                              27,
                            ),
                            foregroundColor: const Color.fromARGB(
                              255,
                              207,
                              207,
                              207,
                            ),
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
      ),
    );
  }
}
