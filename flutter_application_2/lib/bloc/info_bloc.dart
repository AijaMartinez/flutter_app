import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/data/car.dart';
import 'package:flutter_application_2/data/car_service.dart';
import 'package:meta/meta.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final CarService carService;

  InfoBloc(this.carService) : super(InfoInitial()) {
    on<FetchCarInfo>(_onFetchCarInfo);
  }

  Future<void> _onFetchCarInfo(
    FetchCarInfo event,
    Emitter<InfoState> emit,
  ) async {
    emit(InfoLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final car = await carService.fetchCar();
      emit(InfoSuccess(car));
    } catch (e) {
      emit(InfoFailure("Error: ${e.toString()}"));
    }
  }
}
