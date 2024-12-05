import 'dart:math';

import 'package:firefighters_dispository/model/area.dart';

class AreaRepo {
  void save(Area city) {}

  // City load() {}

  Map<String, dynamic> _toJson(Area city) {
    return {
      'areaStart': _pointToList(city.startPoint),
      'areaEnd': _pointToList(city.endPoint),
    };
  }

  List<num> _pointToList(Point point) {
    return [point.x, point.y];
  }
}
