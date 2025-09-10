part of 'info_bloc.dart';

@immutable
sealed class InfoEvent {}

class GoToInfoCar extends InfoEvent {}

class FetchCarInfo extends InfoEvent {}
