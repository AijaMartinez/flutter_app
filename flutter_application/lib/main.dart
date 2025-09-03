import 'package:flutter/material.dart';
import 'package:flutter_application/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './features/user/data/user_service.dart';
import './features/user/logic/user_cubit.dart';
import './features/tareas/data/tarea_service.dart';
import './features/tareas/logic/tarea_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit(UserService())..getUser()),
        BlocProvider(create: (_) => TareaCubit(TareaService())..getTareas()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 125, 13, 13),
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
