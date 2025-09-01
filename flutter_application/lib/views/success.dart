import 'package:flutter/material.dart';

void main() => runApp(const Success());

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exitoso',
      home: Scaffold(
        body: const Center(
          child: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 100,
          ),
        ),
      ),
    );
  }
}
