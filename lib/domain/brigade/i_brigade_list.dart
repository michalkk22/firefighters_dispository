import 'package:firefighters_dispository/constants/data_filepaths.dart';
import 'package:firefighters_dispository/domain/brigade/i_brigade.dart';
import 'package:firefighters_dispository/domain/brigade/i_brigade_collection.dart';
import 'package:firefighters_dispository/domain/event/event.dart';
import 'package:firefighters_dispository/repository/brigade_repo.dart';

class IBrigadeList implements IBrigadeCollection {
  final List<IBrigade> _brigades;

  IBrigadeList({required List<IBrigade> brigades}) : _brigades = brigades;

  factory IBrigadeList.fromRepo() {
    return IBrigadeList(
        brigades: BrigadeRepo(filePath: filePathJsonBrigade).loadAll());
  }

  @override
  Iterable<IBrigade> get all => _brigades;

  @override
  bool sendNearest(Event event) {
    _brigades.sort(
      (a, b) {
        return a.localization
            .distanceTo(event.where)
            .compareTo(b.localization.distanceTo(event.where));
      },
    );
    for (var b in _brigades) {
      if (b.call(event)) return true;
    }
    return false;
  }
}
