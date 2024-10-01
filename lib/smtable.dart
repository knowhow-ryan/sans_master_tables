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
    //OutcomeManager().loadOutcomes(outcomes); //
    
    totalWeight = _sumWeights();
  }

  SmTable.fromMap(tableMap)
      : this(
          id: tableMap[kTABLE_ID] ?? const Uuid().v1(),
          title: tableMap[kTABLE_TITLE],
          outcomes: tableMap[kTABLE_OUTCOMES],
        );

  int _sumWeights() {
    OutcomeManager oManager = OutcomeManager();
    int weight = 0;
    for (String outcomeID in outcomes) {
      weight += oManager[outcomeID]?.weights[id] ?? 0;
    }

    return weight;
  }
}
