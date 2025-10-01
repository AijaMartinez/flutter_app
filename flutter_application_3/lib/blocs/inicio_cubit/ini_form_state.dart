part of 'ini_form_cubit.dart';

@immutable
sealed class IniFormState {}

final class IniFormInitial extends IniFormState {}

class IniFormSuccess extends IniFormState {
  final User user;
  IniFormSuccess(this.user);
}

class IniFormLoading extends IniFormState {}

class IniFormFailure extends IniFormState {}
