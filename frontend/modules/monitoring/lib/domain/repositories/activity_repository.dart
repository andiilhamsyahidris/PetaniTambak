import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:monitoring/monitoring.dart';

abstract class ActivityRepository {
  Future<Either<Failure, List<Activity>>> getSaltActivity(int lowerLimit);
  Future<Either<Failure, List<Activity>>> getTempActivity(int lowerLimit);
}
