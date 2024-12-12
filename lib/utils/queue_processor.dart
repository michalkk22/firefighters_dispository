import 'dart:collection';

import 'package:firefighters_dispository/domain/event/event.dart';

class QueueProcessor {
  final Queue<Event> _queue;
  bool _isRunnung = false;

  QueueProcessor({required Queue<Event> queue}) : _queue = queue;

  void processEvents(Future<void> Function(Event event) handleEvent) {
    if (_isRunnung) return;

    _isRunnung = true;
    _process(handleEvent);
  }

  Future<void> _process(Future<void> Function(Event event) handleEvent) async {
    while (_queue.isNotEmpty) {
      final event = _queue.removeFirst();
      await handleEvent(event);
    }
    _isRunnung = false;
  }
}
