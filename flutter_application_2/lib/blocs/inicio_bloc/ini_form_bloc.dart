import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ini_form_event.dart';
part 'ini_form_state.dart';

class IniFormBloc extends Bloc<IniFormEvent, IniFormState> {
  IniFormBloc() : super(IniFormInitial()) {
    on<SendData>((event, emit) async {
      emit(IniFormLoading());

      await Future.delayed(Duration(seconds: 5));

      emit(IniFormSuccess());
    });
  }
}
