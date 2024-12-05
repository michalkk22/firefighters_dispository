class Team {
  bool _free = true;

  bool get free => _free;

  void setFree() => _free = true;
  void setOccupied() => _free = false;
}
