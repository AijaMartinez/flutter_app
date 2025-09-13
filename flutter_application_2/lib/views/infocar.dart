import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs/car_bloc/info_bloc.dart';
import 'package:flutter_application_2/core/failure.dart';
import 'package:flutter_application_2/core/loading.dart';
import 'package:flutter_application_2/data/service/car_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCar extends StatelessWidget {
  const InfoCar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoBloc(CarService())..add(FetchCarInfo()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 107, 120, 122),
        appBar: AppBar(
          title: Text("Tu carro"),
          backgroundColor: const Color.fromARGB(255, 170, 172, 173),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "https://www.webmotors.com.br/imagens/prod/379556/FERRARI_PUROSANGUE_6.5_V12_GASOLINA_F1DCT_37955609024335538.webp",
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(149, 70, 75, 86),
                  borderRadius: BorderRadius.circular(60),
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
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "Modelo: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: car.modelo),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "Marca: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: car.marca),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "Color: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: car.color),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "Descripción: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: car.descripcion),
                                    ],
                                  ),
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
      ),
    );
  }
}
