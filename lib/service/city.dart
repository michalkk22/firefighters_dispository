import 'dart:math';

import 'package:firefighters_dispository/service/dispository.dart';

class City {
  final Point areaStart;
  final Point areaEnd;
  final Iterable<Point> firefighters;
  final Dispository dispository;

  City({
    required this.areaStart,
    required this.areaEnd,
    required this.firefighters,
    required this.dispository,
  });
}
