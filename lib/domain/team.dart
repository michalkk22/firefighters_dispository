import 'dart:async';

import 'package:firefighters_dispository/constants/config.dart';
import 'package:firefighters_dispository/service/logs_manager/logs_manager.dart';
import 'package:firefighters_dispository/utils/single_random.dart';

class Team {
  bool _free = true;
  // TODO: notify in action
  LogsManager _logsManager = LogsManager();
  // TODO: well, also some brigade id and team id should be logged to identify who done stuff

  bool get free => _free;

  bool send(Duration travelTime) {
    if (!_free) return false;
    _action(travelTime);
    return true;
  }

  Future<void> _action(Duration travelTime) async {
    _free = false;
    _wait(travelTime);
    Duration actionTime = Duration(
        seconds: SingleRandom().random.nextInt(
                Config.eventActionTimeMax - Config.eventActionTimeMin) +
            Config.eventActionTimeMin);
    _wait(actionTime);
    _wait(travelTime);
    _free = true;
  }

  void _wait(Duration duration) {
    Timer(duration, () {});
  }
}
