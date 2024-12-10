import 'dart:math';

import 'package:firefighters_dispository/domain/brigade/i_brigade.dart';
import 'package:firefighters_dispository/domain/event/event.dart';
import 'package:firefighters_dispository/domain/team/team.dart';
import 'package:firefighters_dispository/domain/team/team_collection.dart';
import 'package:firefighters_dispository/domain/team/team_set.dart';

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
  }) : _localization = localization {
    _teams = TeamSet();
    for (var i = 0; i < teamsNumber; i++) {
      _teams.add(Team(this, teamNumber: i));
    }
  }

  @override
  bool call(Event event) {
    return _teams.sendOne(event);
  }

  @override
  Point<double> get localization => _localization;

  @override
  bool get hasFreeTeam => _teams.hasFree();

  factory Brigade.fromJson(jsonMap) {
    if (jsonMap['name'] == null ||
        jsonMap['localization'] == null ||
        jsonMap['teamsNumber'] == null) {
      throw ArgumentError('Invalid JSON: Missing required fields');
    }

    if (jsonMap['localization'] is! Map<String, dynamic> ||
        jsonMap['localization']['x'] == null ||
        jsonMap['localization']['y'] == null) {
      throw ArgumentError(
          'Invalid JSON: Localization must be a map with x and y keys');
    }

    return Brigade(
        name: jsonMap['name'],
        localization: Point(
          jsonMap['localization']['x'],
          jsonMap['localization']['y'],
        ),
        teamsNumber: jsonMap['teamsNumber']);
  }

  @override
  String toString() {
    return '$name $localization $teamsNumber';
  }
}
