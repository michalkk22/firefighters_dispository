import 'dart:async';

import 'package:firefighters_dispository/constants/config.dart';
import 'package:firefighters_dispository/domain/event/event.dart';
import 'package:firefighters_dispository/service/logs_manager/logs_manager.dart';
import 'package:firefighters_dispository/utils/single_random.dart';

class Team {
  bool _free = true;
  final int teamNumber;
  LogsManager _logsManager = LogsManager();

  Team({required this.teamNumber});

  bool get free => _free;

  bool send(Event event) {
    if (!_free) return false;
    _action();
    return true;
  }

  Future<void> _action() async {
    _free = false;
    Duration travelTime =
        _randomTime(maxMilliseconds: Config.travelTimeMaxMilliseconds);
    _wait(travelTime);
    Duration actionTime = _randomTime(
      maxMilliseconds: Config.eventActionTimeSecondsMax * 1000,
      minMilliseconds: Config.eventActionTimeSecondsMin * 1000,
    );
    _wait(actionTime);
    _wait(travelTime);
    _free = true;
  }

  void _wait(Duration duration) {
    Timer(duration, () {});
  }

  Duration _randomTime(
      {required int maxMilliseconds, int minMilliseconds = 0}) {
    return Duration(
        milliseconds: (SingleRandom().random.nextDouble() *
                    (maxMilliseconds - minMilliseconds) +
                minMilliseconds)
            .toInt());
  }

  void _report(String text) {}
}
