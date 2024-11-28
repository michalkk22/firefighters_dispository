import 'dart:math';

class SingleRandom {
  SingleRandom._privateConstructor();
  static final SingleRandom _instance = SingleRandom._privateConstructor();
  factory SingleRandom() => _instance;

  final Random _random = Random();
  Random get random => _random;
}
