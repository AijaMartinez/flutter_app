import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/tarea.dart';
import '../data/tarea_service.dart';

part 'tarea_state.dart';

class TareaCubit extends Cubit<TareaState> {
  final TareaService service;

  TareaCubit(this.service) : super(TareaInitial());

  Future<void> getTareas() async {
    try {
      emit(TareaLoading());
      final tareas = await service.fetchTareas();
      await Future.delayed(const Duration(seconds: 1));

      emit(TareaSuccess());

      await Future.delayed(const Duration(seconds: 2));

      emit(TareaLoaded(tareas));
    } catch (e) {
      emit(TareaError("Error al cargar tareas: $e"));
    }
  }
}
