import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  String name;
  String details;

  Activity({
    required this.name,
    required this.details,
  });

  @override
  List<Object?> get props => [
        name,
        details,
      ];
}
