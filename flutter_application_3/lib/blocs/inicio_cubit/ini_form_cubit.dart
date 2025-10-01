import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/data/service/user_service.dart';
import 'package:meta/meta.dart';
part 'ini_form_state.dart';

class IniFormCubit extends Cubit<IniFormState> {
  final UserService userService;
  IniFormCubit({required this.userService}) : super(IniFormInitial());

  Future<void> sendData({
    required String nombre,
    required String apellido,
    required String cedula,
  }) async {
    emit(IniFormLoading());

    try {
      final fetchedUser = await userService.fetchUser();
      await Future.delayed(const Duration(seconds: 4));
      final isValid =
          fetchedUser.nombre.trim().toLowerCase() ==
              nombre.trim().toLowerCase() &&
          fetchedUser.apellido.trim().toLowerCase() ==
              apellido.trim().toLowerCase() &&
          fetchedUser.cedula.toString() == cedula.trim();

      if (isValid) {
        emit(IniFormSuccess());
      } else {
        emit(IniFormFailure());
      }
    } catch (e) {
      emit(IniFormFailure());
    }
  }
}
