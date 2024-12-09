abstract class EventType {
  late final String _typeName;
  String get typeName => _typeName;
  @override
  String toString() {
    return _typeName;
  }
}

class EventFire extends EventType {
  EventFire() {
    super._typeName = 'pożar';
  }
}

class EventLocal extends EventType {
  EventLocal() {
    super._typeName = 'lokalne zagrożenie';
  }
}
