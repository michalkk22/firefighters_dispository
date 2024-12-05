abstract class EventType {
  late final String _typeName;
  String get typeName => _typeName;
}

class EventFire extends EventType {
  EventFire() {
    super._typeName = 'Fire';
  }
}

class EventLocal extends EventType {
  EventLocal() {
    super._typeName = 'Local danger';
  }
}
