part of 'temp_activity_bloc.dart';

abstract class TempActivityState extends Equatable {
  const TempActivityState();

  @override
  List<Object> get props => [];
}

class TempActivityEmpty extends TempActivityState {}

class TempActivityLoading extends TempActivityState {}

class TempActivityError extends TempActivityState {
  final String message;
  const TempActivityError(this.message);

  @override
  List<Object> get props => [message];
}

class TempActivityHasData extends TempActivityState {
  final List<Activity> activity;
  const TempActivityHasData(this.activity);

  @override
  List<Object> get props => [activity];
}
