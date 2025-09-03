part of 'tarea_cubit.dart';

abstract class TareaState {}

class TareaInitial extends TareaState {}

class TareaLoading extends TareaState {}

class TareaLoaded extends TareaState {
  final List<TareaElement> tareas;
  TareaLoaded(this.tareas);
}

class TareaSuccess extends TareaState {}

class TareaError extends TareaState {
  final String message;
  TareaError(this.message);
}
