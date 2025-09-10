import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    on<GoToInfoCar>((event, emit) {
      emit(NavigateToInfoCar());
    });

    on<FetchCarInfo>(_onFetchCarInfo);
  }

  Future<void> _onFetchCarInfo(
    FetchCarInfo event,
    Emitter<InfoState> emit,
  ) async {
    emit(InfoLoading());

    await Future.delayed(const Duration(seconds: 2));

    final success = DateTime.now().second % 2 == 0;

    if (success) {
      emit(InfoLoaded(""));
    } else {
      emit(InfoFailure("No se pudo cargar la información"));
    }
  }
}
