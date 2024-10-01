import "package:sans_master_tables/smoutcome.dart";
import "package:sans_master_tables/smtable.dart";

class OutcomeManager {
  Map<String, SmOutcome> _loadedOutcomes = {};

  static final OutcomeManager _instance = OutcomeManager._privateConstructor();

  OutcomeManager._privateConstructor();

  factory OutcomeManager() {
    return _instance;
  }

  //OutcomeManager retrieves Outcomes just like Map
  SmOutcome? operator [](String outcomeID) {
    SmOutcome? outcome;
    //TODO: If outcomeID doesn't exist, load it from file and add it to _loadedOutcomes
    
    //TODO: What if outcomeID doesn't correspond to a saved Outcome?

    return outcome;
  }

  void _addOutcome(SmOutcome newOutcome) => _loadedOutcomes[newOutcome.id] = newOutcome;

  void loadOutcomesFromList(List<String> outcomeIDs) {
    //TODO: make sure the provided Outcomes are all loaded
  }

  Map<String, int> getOutcomesFromList(List<String> outcomeIDs) {
    //TODO: assemble Map of Outcomes to return
    return {};
  }

  Map<String, int> getTableOutcomes(SmTable table) {
    //TODO: assemble Map of Outcomes to return
    return {};
  }
}
