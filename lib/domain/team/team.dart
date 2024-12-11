import 'dart:async';

import 'package:firefighters_dispository/constants/config.dart';
import 'package:firefighters_dispository/domain/event/event.dart';
import 'package:firefighters_dispository/domain/brigade/i_brigade.dart';
import 'package:firefighters_dispository/domain/team/team_exception.dart';
import 'package:firefighters_dispository/domain/logs_manager.dart';
import 'package:firefighters_dispository/utils/single_random.dart';

class Team {
  bool _free = true;
  final IBrigade _brigade;
  final int teamNumber;
  final LogsManager _logsManager = LogsManager();

  Team(this._brigade, {required this.teamNumber});

  bool get free => _free;

  bool send(Event event) {
    if (!_free) {
      throw SendingNotFreeTeamException();
    }

    _free = false;
    _action(event);
    return true;
  }

  Future<void> _action(Event event) async {
    _report(text: 'odjazd z jednostki');
    Duration travelTime =
        _randomTime(maxMilliseconds: Config.travelTimeMaxMilliseconds);
    await Future.delayed(travelTime);

    _report(text: 'na miejscu', event: event);
    if (!event.isFalse) {
      Duration actionTime = _randomTime(
        maxMilliseconds: Config.eventActionTimeSecondsMax * 1000,
        minMilliseconds: Config.eventActionTimeSecondsMin * 1000,
      );
      await Future.delayed(actionTime);
    }

    _report(text: 'wracamy');
    await Future.delayed(travelTime);
    _free = true;
  }

  Duration _randomTime(
      {required int maxMilliseconds, int minMilliseconds = 0}) {
    return Duration(
        milliseconds: (SingleRandom().random.nextDouble() *
                    (maxMilliseconds - minMilliseconds) +
                minMilliseconds)
            .toInt());
  }

  void _report({required String text, Event? event}) {
    String report = '${_brigade.name}: drużyna $teamNumber: $text';
    if (event != null) {
      report += ', ${event.type} - ';
      event.isFalse
          ? report += 'alarm fałszywy'
          : report += 'przystępujemy do akcji';
    }
    _logsManager.log(report);
  }
}
