import 'dart:convert';
import 'dart:io';

import 'package:firefighters_dispository/domain/area.dart';
import 'package:firefighters_dispository/repository/json_repo.dart';
import 'package:firefighters_dispository/repository/repo_exception.dart';

class AreaRepo implements JsonRepo<Area> {
  @override
  final String filePath;

  AreaRepo({required this.filePath});

  // @override
  // void save(Area area) {
  //   final file = File(filePath);
  //   final jsonData = jsonEncode(area.toJson());
  //   file.writeAsStringSync(jsonData);
  // }

  @override
  Area load() {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw FileNotFoundException(filePath);
    }
    final jsonString = file.readAsStringSync();
    final jsonMap = jsonDecode(jsonString);
    try {
      return Area.fromJson(jsonMap);
    } catch (_) {
      throw AreaLoadException();
    }
  }

  @override
  List<Area> loadAll() {
    try {
      final file = File(filePath);
      if (!file.existsSync()) {
        throw FileNotFoundException(filePath);
      }
      final jsonString = file.readAsStringSync();
      final jsonList = jsonDecode(jsonString) as List;

      return jsonList.map(
        (json) {
          try {
            return Area.fromJson(json);
          } catch (_) {
            throw AreaLoadException();
          }
        },
      ).toList();
    } catch (_) {
      throw FileLoadException();
    }
  }
}
