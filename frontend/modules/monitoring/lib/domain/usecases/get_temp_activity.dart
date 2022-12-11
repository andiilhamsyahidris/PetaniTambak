import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:monitoring/monitoring.dart';

class GetTempActivity {
  final ActivityRepository repository;

  GetTempActivity(this.repository);

  Future<Either<Failure, List<Activity>>> execute(int lowerLimit) {
    return repository.getTempActivity(lowerLimit);
  }
}
