import 'dart:io';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:monitoring/monitoring.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityRemoteDatasource remoteDatasource;

  ActivityRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Activity>>> getSaltActivity(
      int lowerLimit) async {
    try {
      final result = await remoteDatasource.getSaltActivity(lowerLimit);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Activity>>> getTempActivity(
      int lowerLimit) async {
    try {
      final result = await remoteDatasource.getTempActivity(lowerLimit);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
