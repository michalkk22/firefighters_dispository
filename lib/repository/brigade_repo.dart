import 'dart:convert';
import 'dart:io';

import 'package:firefighters_dispository/domain/brigade/brigade.dart';
import 'package:firefighters_dispository/repository/json_repo.dart';
import 'package:firefighters_dispository/repository/repo_exception.dart';

class BrigadeRepo implements JsonRepo<Brigade> {
  @override
  final String filePath;

  BrigadeRepo({required this.filePath});

  // @override
  // void save(Brigade brigade) {
  //   final file = File(filePath);
  //   final jsonData = jsonEncode(brigade.toJson());
  //   file.writeAsStringSync(jsonData);
  // }

  @override
  Brigade load() {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw FileNotFoundException(filePath);
    }
    final jsonString = file.readAsStringSync();
    final jsonMap = jsonDecode(jsonString);
    try {
      return Brigade.fromJson(jsonMap);
    } catch (_) {
      throw BrigadeLoadException();
    }
  }

  @override
  List<Brigade> loadAll() {
    try {
      final file = File(filePath);

      if (!file.existsSync()) {
        throw FileNotFoundException(filePath);
      }

      final jsonString = file.readAsStringSync();
      final jsonList = jsonDecode(jsonString) as List;

      return jsonList.map((json) {
        try {
          return Brigade.fromJson(json);
        } catch (_) {
          throw BrigadeLoadException();
        }
      }).toList();
    } catch (_) {
      throw FileLoadException();
    }
  }
}
