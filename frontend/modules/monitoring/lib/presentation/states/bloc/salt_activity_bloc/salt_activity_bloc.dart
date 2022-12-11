import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monitoring/domain/usecases/get_salt_activity.dart';
import 'package:monitoring/monitoring.dart';

part 'salt_activity_event.dart';
part 'salt_activity_state.dart';

class SaltActivityBloc extends Bloc<SaltActivityEvent, SaltActivityState> {
  final GetSaltActivity getSaltActivity;

  SaltActivityBloc({required this.getSaltActivity})
      : super(SaltActivityEmpty()) {
    on<FetchSaltActivity>((event, emit) async {
      emit(SaltActivityLoading());

      final lowerLimit = event.lowerLimit;
      final result = await getSaltActivity.execute(lowerLimit);

      result.fold(
        (failure) => emit(SaltActivityError(failure.message)),
        (data) => emit(SaltActivityHasData(data)),
      );
    });
  }
}
