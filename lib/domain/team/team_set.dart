import 'package:firefighters_dispository/domain/event/event.dart';
import 'package:firefighters_dispository/domain/team/team.dart';
import 'package:firefighters_dispository/domain/team/team_collection.dart';
import 'package:firefighters_dispository/domain/team/team_exception.dart';

class TeamSet implements TeamCollection {
  final Set<Team> _teams = {};

  @override
  void add(Team team) {
    _teams.add(team);
  }

  @override
  bool hasFree() {
    for (var t in _teams) {
      if (t.free) return true;
    }
    return false;
  }

  @override
  bool sendOne(Event event) {
    for (var t in _teams) {
      if (t.free) {
        try {
          t.send(event);
          return true;
        } on SendingNotFreeTeamException {
          return false;
        }
      }
    }
    return false;
  }
}
