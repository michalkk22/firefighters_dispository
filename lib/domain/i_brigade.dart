import 'dart:math';

abstract class IBrigade {
  Point<double> get localization;
  bool call();
}
