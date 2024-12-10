import 'package:firefighters_dispository/constants/config.dart';
import 'package:firefighters_dispository/domain/area.dart';
import 'package:firefighters_dispository/domain/event/event.dart';

class PeriodicRandomEventStream {
  final Duration interval;
  final Area area;

  PeriodicRandomEventStream({
    required this.area,
    this.interval =
        const Duration(milliseconds: Config.eventIntervalMiliseconds),
  });

  Stream<Event> events() => Stream.periodic(
        interval,
        (_) => Event.random(area),
      );
}
