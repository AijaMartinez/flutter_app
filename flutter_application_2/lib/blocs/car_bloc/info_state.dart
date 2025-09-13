part of 'info_bloc.dart';

@immutable
sealed class InfoState {}

class InfoInitial extends InfoState {}

class NavigateToInfoCar extends InfoState {}

class InfoSuccess extends InfoState {
  final Car car;
  InfoSuccess(this.car);
}

class InfoLoading extends InfoState {}

class InfoFailure extends InfoState {
  final String error;
  InfoFailure(this.error);
}
