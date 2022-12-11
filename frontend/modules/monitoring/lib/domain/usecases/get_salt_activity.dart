import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:monitoring/monitoring.dart';

class GetSaltActivity {
  final ActivityRepository repository;

  GetSaltActivity(this.repository);

  Future<Either<Failure, List<Activity>>> execute(int lowerLimit) {
    return repository.getSaltActivity(lowerLimit);
  }
}
