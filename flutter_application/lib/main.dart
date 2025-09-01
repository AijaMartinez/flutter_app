import 'package:flutter/material.dart';
import 'package:flutter_application/views/failure.dart';
import 'package:flutter_application/views/home_view.dart';
import 'package:flutter_application/views/loading.dart';
import 'package:flutter_application/views/success.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 125, 13, 13),
        ),
      ),
      home: const HomeView(),
    );
  }
}
