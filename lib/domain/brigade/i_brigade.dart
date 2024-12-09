import 'dart:math';

abstract class IBrigade {
  Point<double> get localization;
  String get name;
  bool get hasFreeTeam;
  bool call();
}
