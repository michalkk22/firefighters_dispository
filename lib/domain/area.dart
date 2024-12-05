import 'dart:math';

class Area {
  final Point startPoint;
  final Point endPoint;

  Point<double> randomPoint() {
    return Point(
      Random().nextDouble() * (endPoint.x - startPoint.x),
      Random().nextDouble() * (endPoint.y - startPoint.y),
    );
  }

  Area({
    required this.startPoint,
    required this.endPoint,
  });

  Map<String, dynamic> toJson() {
    return {
      'startPoint': {'x': startPoint.x, 'y': startPoint.y},
      'endPoint': {'x': endPoint.x, 'y': endPoint.y},
    };
  }

  factory Area.fromJson(Map<String, dynamic> json) {
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
