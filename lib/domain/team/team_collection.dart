import 'package:firefighters_dispository/domain/event/event.dart';
import 'package:firefighters_dispository/domain/team/team.dart';

abstract interface class TeamCollection {
  void add(Team team);
  bool hasFree();
  bool sendOne(Event event);
}
