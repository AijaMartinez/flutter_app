import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/user.dart';
import '../data/user_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserService service;

  UserCubit(this.service) : super(UserInitial());

  Future<void> getUser() async {
    try {
      emit(UserLoading());
      final user = await service.fetchUser();
      await Future.delayed(const Duration(seconds: 1));

      emit(UserSuccess());

      await Future.delayed(const Duration(seconds: 2));

      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError("Error: ${e.toString()}"));
    }
  }
}
