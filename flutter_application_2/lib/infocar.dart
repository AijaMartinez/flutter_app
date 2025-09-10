import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/info_bloc.dart';
import 'package:flutter_application_2/core/failure.dart';
import 'package:flutter_application_2/core/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCar extends StatelessWidget {
  const InfoCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Car")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://www.webmotors.com.br/imagens/prod/379556/FERRARI_PUROSANGUE_6.5_V12_GASOLINA_F1DCT_37955609024335538.webp",
            ),
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
                  BlocBuilder<InfoBloc, InfoState>(
                    builder: (context, state) {
                      if (state is InfoLoading) {
                        return Loading();
                      } else if (state is InfoFailure) {
                        return Failure();
                      } else if (state is InfoSuccess) {
                        final car = state.car;
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Modelo: ${car.modelo}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Marca: ${car.marca}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Color: ${car.color}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Descripción: ${car.descripcion}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }
                      return const Center(
                        child: Text(
                          "Presiona para cargar la información del carro",
                        ),
                      );
                    },
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
