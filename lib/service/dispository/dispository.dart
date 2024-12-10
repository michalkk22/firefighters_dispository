import 'dart:async';
import 'dart:collection';

import 'package:firefighters_dispository/domain/brigade/i_brigade_collection.dart';
import 'package:firefighters_dispository/domain/brigade/i_brigade_list.dart';
import 'package:firefighters_dispository/domain/event/event.dart';
import 'package:firefighters_dispository/domain/logs_manager.dart';

class Dispository {
  final LogsManager _logsManager = LogsManager();
  late final IBrigadeCollection _brigades;
  final Stream<Event> _events;
  final Queue<Event> _queue = Queue();
  final Completer<void> _completer = Completer();

  Dispository({required Stream<Event> events}) : _events = events {
    try {
      _brigades = IBrigadeList.fromRepo();
    } catch (e) {
      _logsManager.log('$e');
    }
    _start();
  }

  void _start() {
    for (var brigade in _brigades.all) {
      _logsManager.log('Nawiązano kontakt z: $brigade drużyn.');
    }

    _listenToStream();
    _processEvents();
  }

  void _listenToStream() {
    _events.listen(
      (event) {
        _logsManager.log('Otrzymano zgłoszenie: $event');
        _queue.add(event);
        if (!_completer.isCompleted) {
          _completer.complete();
        }
      },
      onDone: () => _logsManager.log('Zamknięto nadawanie zgłoszeń.'),
      onError: (error) => _logsManager.log('Błąd nadawanie zgłoszeń: $error'),
    );
  }

  Future<void> _processEvents() async {
    while (true) {
      await _completer.future;

      while (_queue.isNotEmpty) {
        final event = _queue.removeFirst();
        await _handleEvent(event);
      }

      _completer.complete();
    }
  }

  Future<void> _handleEvent(Event event) async {
    while (!_brigades.sendNearest(event)) {
      _logsManager.log('Brak wolnych drużyn, czekam...');
      await Future.delayed(const Duration(seconds: 1));
    }

    _logsManager.log('Drużyna w drodze do: $event');
  }
}
