import 'dart:async';
import 'dart:math';

import 'package:firefighters_dispository/constants/config.dart';
import 'package:firefighters_dispository/domain/i_brigade.dart';
import 'package:firefighters_dispository/utils/single_random.dart';

class Brigade implements IBrigade {
  final Point<double> _localization;
  final int _teamsNumber;
  int _counter;

  Brigade({required Point<double> localization, required int teamsNumber})
      : _localization = localization,
        _teamsNumber = teamsNumber,
        _counter = teamsNumber;

  @override
  bool call() {
    if (_counter < 1) return false;

    _sendTeam();
    return true;
  }

  void _sendTeam() async {
    _counter--;
    Duration travelTime = _randomTime(Config.travelTimeMaxMilliseconds);
    _wait(travelTime);
  }

  Duration _randomTime(int maXmilliseconds) {
    return Duration(
        milliseconds:
            (SingleRandom().random.nextDouble() * maXmilliseconds).toInt());
  }

  void _wait(Duration duration) {
    Timer(duration, () {});
  }

  @override
  Point<double> get localization => _localization;
}
