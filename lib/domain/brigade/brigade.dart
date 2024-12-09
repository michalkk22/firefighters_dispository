import 'dart:math';

import 'package:firefighters_dispository/domain/brigade/i_brigade.dart';
import 'package:firefighters_dispository/domain/team/team_collection.dart';

class Brigade implements IBrigade {
  @override
  final String name;
  final Point<double> _localization;
  final int teamsNumber;
  late final TeamCollection _teams;

  Brigade({
    required this.name,
    required Point<double> localization,
    required this.teamsNumber,
  }) : _localization = localization;

  @override
  bool call() {
    return _teams.sendOne();
  }

  @override
  Point<double> get localization => _localization;

  @override
  bool get hasFreeTeam => _teams.hasFree();
}
