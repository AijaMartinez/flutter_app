import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/info_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCar extends StatelessWidget {
  const InfoCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Car information")),
      body: SingleChildScrollView(
        child: Container(
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
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
