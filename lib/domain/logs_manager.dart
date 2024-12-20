import 'dart:async';

class LogsManager {
  LogsManager._privateConstructor();
  static final _instance = LogsManager._privateConstructor();
  factory LogsManager() => _instance;

  final StreamController<List<String>> _controller =
      StreamController.broadcast();
  final List<String> _logs = [];

  Stream<List<String>> get stream => _controller.stream;

  void log(String text) {
    _logs.add(text);
    _controller.add(List.unmodifiable(_logs));
    print('Logged: $text');
  }
}
