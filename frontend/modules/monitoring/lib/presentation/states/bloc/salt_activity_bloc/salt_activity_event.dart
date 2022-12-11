part of 'salt_activity_bloc.dart';

abstract class SaltActivityEvent {
  const SaltActivityEvent();
}

class FetchSaltActivity extends SaltActivityEvent {
  final int lowerLimit;
  const FetchSaltActivity(this.lowerLimit);
}
