part of 'temp_activity_bloc.dart';

abstract class TempActivityEvent {
  const TempActivityEvent();
}

class FetchTempActivity extends TempActivityEvent {
  final int lowerLimit;
  const FetchTempActivity(this.lowerLimit);
}
