part of 'salt_activity_bloc.dart';

abstract class SaltActivityState extends Equatable {
  const SaltActivityState();

  @override
  List<Object> get props => [];
}

class SaltActivityEmpty extends SaltActivityState {}

class SaltActivityLoading extends SaltActivityState {}

class SaltActivityError extends SaltActivityState {
  final String message;

  const SaltActivityError(this.message);

  @override
  List<Object> get props => [message];
}

class SaltActivityHasData extends SaltActivityState {
  final List<Activity> activity;
  const SaltActivityHasData(this.activity);

  @override
  List<Object> get props => [activity];
}
