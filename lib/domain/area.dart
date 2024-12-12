import 'dart:math';

import 'package:firefighters_dispository/repository/area_repo.dart';
import 'package:firefighters_dispository/utils/single_random.dart';
import 'package:firefighters_dispository/constants/data_filepaths.dart';

class Area {
  final Point startPoint;
  final Point endPoint;

  Point<double> randomPoint() {
    Random random = SingleRandom().random;
    return Point(
      random.nextDouble() * (endPoint.x - startPoint.x).abs() + startPoint.x,
      random.nextDouble() * (endPoint.y - startPoint.y).abs() + startPoint.y,
    );
  }

  Area({
    required this.startPoint,
    required this.endPoint,
  });

  factory Area.fromRepo() {
    return AreaRepo(filePath: filePathJsonArea).load();
  }

  Map<String, dynamic> toJson() {
    return {
      'startPoint': {'x': startPoint.x, 'y': startPoint.y},
      'endPoint': {'x': endPoint.x, 'y': endPoint.y},
    };
  }

  factory Area.fromJson(Map<String, dynamic> json) {
    if (json['startPoint'] is! Map<String, dynamic> ||
        json['startPoint']['x'] == null ||
        json['startPoint']['y'] == null) {
      throw ArgumentError(
          'Invalid JSON: startPoint must be a map with x and y keys');
    }

    if (json['endPoint'] is! Map<String, dynamic> ||
        json['endPoint']['x'] == null ||
        json['endPoint']['y'] == null) {
      throw ArgumentError(
          'Invalid JSON: endPoint must be a map with x and y keys');
    }

    return Area(
      startPoint: Point(
        json['startPoint']['x'],
        json['startPoint']['y'],
      ),
      endPoint: Point(
        json['endPoint']['x'],
        json['endPoint']['y'],
      ),
    );
  }
}
