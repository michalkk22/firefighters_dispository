import 'package:firefighters_dispository/domain/team/team.dart';

abstract class TeamCollection {
  void add(Team team);
  bool hasFree();
  bool sendOne();
}
