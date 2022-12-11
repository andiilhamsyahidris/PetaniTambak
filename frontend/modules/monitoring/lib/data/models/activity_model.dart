import 'package:equatable/equatable.dart';
import 'package:monitoring/monitoring.dart';

class ActivityModel extends Equatable {
  final String name;
  final String details;

  const ActivityModel({
    required this.name,
    required this.details,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        name: json['name'],
        details: json['details'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'details': details,
      };
  Activity toEntity() {
    return Activity(
      name: name,
      details: details,
    );
  }

  @override
  List<Object?> get props => [
        name,
        details,
      ];
}
