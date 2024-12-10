import 'package:firefighters_dispository/domain/brigade/i_brigade.dart';
import 'package:firefighters_dispository/domain/event/event.dart';

abstract interface class IBrigadeCollection {
  Iterable<IBrigade> get all;
  bool sendNearest(Event event);
}
