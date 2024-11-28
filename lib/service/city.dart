import 'dart:math';

class City {
  final Point areaStart;
  final Point areaEnd;
  final Map<Iterable<Point>, int> brigades;

  Point call() {
    return Point(
      Random().nextDouble() * (areaEnd.x - areaStart.x),
      Random().nextDouble() * (areaEnd.y - areaStart.y),
    );
  }

  City({
    required this.areaStart,
    required this.areaEnd,
    required this.brigades,
  });
}
