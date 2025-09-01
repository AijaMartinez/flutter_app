import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() => runApp(const Loading());

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cargando...',
      home: Scaffold(
        body: Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: const Color.fromARGB(255, 79, 57, 161),
            size: 100,
          ),
        ),
      ),
    );
  }
}
