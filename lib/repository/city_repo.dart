import 'dart:math';

import 'package:firefighters_dispository/service/city.dart';

class CityRepo {
  void save(City city) {}

  // City load() {}

  Map<String, dynamic> toJson(City city) {
    return {
      'areaStart': _pointToList(city.areaStart),
      'areaEnd': _pointToList(city.areaEnd),
      'brigades': city.brigades.map(
        (key, value) {
          return MapEntry(
            key.map((point) => _pointToList(point)),
            value,
          );
        },
      )
    };
  }

  List<num> _pointToList(Point point) {
    return [point.x, point.y];
  }
}
