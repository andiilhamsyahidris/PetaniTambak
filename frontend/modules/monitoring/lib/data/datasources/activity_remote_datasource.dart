import 'dart:convert';

import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import 'package:monitoring/monitoring.dart';

abstract class ActivityRemoteDatasource {
  Future<List<ActivityModel>> getSaltActivity(int lowerLimit);
  Future<List<ActivityModel>> getTempActivity(int lowerLimit);
}

class ActivityRemoteDatasourceImpl implements ActivityRemoteDatasource {
  final http.Client client;

  ActivityRemoteDatasourceImpl({required this.client});

  @override
  Future<List<ActivityModel>> getSaltActivity(int lowerLimit) async {
    final response = await client.get(Uri.parse('$url/salinitas/$lowerLimit'));
    if (response.statusCode == 200) {
      return ActivityResponse.fromJson(json.decode(response.body)).actList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ActivityModel>> getTempActivity(int lowerLimit) async {
    final response = await client.get(Uri.parse('$url/suhu/$lowerLimit'));
    if (response.statusCode == 200) {
      return ActivityResponse.fromJson(json.decode(response.body)).actList;
    } else {
      throw ServerException();
    }
  }
}
