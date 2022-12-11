import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monitoring/domain/usecases/get_temp_activity.dart';
import 'package:monitoring/monitoring.dart';
part 'temp_activity_event.dart';
part 'temp_activity_state.dart';

class TempActivityBloc extends Bloc<TempActivityEvent, TempActivityState> {
  final GetTempActivity getTempActivity;
  TempActivityBloc({required this.getTempActivity})
      : super(TempActivityEmpty()) {
    on<FetchTempActivity>((event, emit) async {
      emit(TempActivityLoading());

      final lowerLimit = event.lowerLimit;
      final result = await getTempActivity.execute(lowerLimit);

      result.fold(
        (failure) => emit(TempActivityError(failure.message)),
        (data) => emit(TempActivityHasData(data)),
      );
    });
  }
}
