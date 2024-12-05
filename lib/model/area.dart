import 'dart:math';

class Area {
  final Point startPoint;
  final Point endPoint;

  Point newCall() {
    return Point(
      Random().nextDouble() * (endPoint.x - startPoint.x),
      Random().nextDouble() * (endPoint.y - startPoint.y),
    );
  }

  Area({
    required this.startPoint,
    required this.endPoint,
  });
}
