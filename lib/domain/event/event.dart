import 'dart:math';

import 'package:firefighters_dispository/constants/config.dart';
import 'package:firefighters_dispository/domain/area.dart';
import 'package:firefighters_dispository/domain/event/event_type.dart';
import 'package:firefighters_dispository/utils/single_random.dart';

class Event {
  final EventType type;
  final Point<double> _where;
  final bool _isFalse;
  final int asd;

  static bool _drawIsFalse() =>
      Random().nextDouble() < Config.eventChanceFalse ? true : false;

  Event(this.asd,
      {required this.type, required Point<double> where, required bool isFalse})
      : _where = where,
        _isFalse = isFalse;

  factory Event.random(Area area, int asd) {
    EventType type = SingleRandom().random.nextDouble() < Config.eventChanceFire
        ? EventFire()
        : EventLocal();

    Point<double> where = area.randomPoint();
    bool isFalse = _drawIsFalse();
    return Event(type: type, where: where, isFalse: isFalse, asd);
  }

  bool get isFalse => _isFalse;
  Point<double> get where => _where;

  @override
  String toString() {
    return '$type, lokalizacja: (${_where.x}, ${_where.y}), NUMBER: $asd';
  }
}
