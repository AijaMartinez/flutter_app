part of 'info_bloc.dart';

@immutable
sealed class InfoState {}

class InfoInitial extends InfoState {}

class NavigateToInfoCar extends InfoState {}

class InfoLoading extends InfoState {}

class InfoLoaded extends InfoState {
  final String data;
  InfoLoaded(this.data);
}

class InfoFailure extends InfoState {
  final String error;
  InfoFailure(this.error);
}
