import 'package:equatable/equatable.dart';
import 'package:monitoring/monitoring.dart';

class ActivityResponse extends Equatable {
  final List<ActivityModel> actList;

  const ActivityResponse({required this.actList});

  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      ActivityResponse(
          actList: List<ActivityModel>.from(
        (json['activities'] as List).map((e) => ActivityModel.fromJson(e)),
      ));
  Map<String, dynamic> toJson() => {
        'activities': List<dynamic>.from(actList.map((e) => e.toJson())),
      };
  @override
  List<Object> get props => [actList];
}
