import 'dart:convert';
import 'dart:io';

import 'package:firefighters_dispository/constants/data_filepaths.dart';
import 'package:firefighters_dispository/domain/area.dart';

class AreaRepo {
  final String filePath = filePathJsonArea;

  void save(Area area) {
    final file = File(filePath);
    final jsonData = jsonEncode(area.toJson());
    file.writeAsStringSync(jsonData);
  }

  // Area load() {}
}
