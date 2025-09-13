part of 'ini_form_bloc.dart';

@immutable
sealed class IniFormState {}

final class IniFormInitial extends IniFormState {}

class IniFormSuccess extends IniFormState {}

class IniFormLoading extends IniFormState {}

class IniFormFailure extends IniFormState {}
