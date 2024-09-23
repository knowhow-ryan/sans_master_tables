import "package:sans_master_tables/smoutcome.dart";

class OutcomeManager {
  Map<String, SmOutcome> loadedOutcomes = {};

  static final OutcomeManager _instance = OutcomeManager._privateConstructor();

  OutcomeManager._privateConstructor();

  factory OutcomeManager() {
    return _instance;
  }

  //TODO: BOOKMARK
}
