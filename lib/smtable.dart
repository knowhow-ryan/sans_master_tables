import 'package:sans_master_tables/constants/smkeys.dart';
import 'package:uuid/uuid.dart';
import 'outcome_manager.dart';

class SmTable {
  String id;
  String title;
  List<String> outcomes;
  int totalWeight = 0;

  SmTable({
    required this.id,
    required this.title,
    required this.outcomes,
  }) {
    _sumWeights();
  }

  SmTable.fromMap(tableMap)
      : this(
          id: tableMap[kTABLE_ID] ?? const Uuid().v1(),
          title: tableMap[kTABLE_TITLE],
          outcomes: tableMap[kTABLE_OUTCOMES],
        );

  int _sumWeights() {
    totalWeight = 0;
    for (String outcome in outcomes) {
      totalWeight += OutcomeManager[outcome].weight[id];
    }

    return totalWeight;
  }
}
