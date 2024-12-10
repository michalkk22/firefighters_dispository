import 'dart:math';

import 'package:firefighters_dispository/domain/event/event.dart';

abstract interface class IBrigade {
  Point<double> get localization;
  String get name;
  bool get hasFreeTeam;
  bool call(Event event);
}
