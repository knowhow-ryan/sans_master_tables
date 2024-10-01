import 'constants/smkeys.dart';
import 'package:uuid/uuid.dart';

///Represents a single Outcome from a Table.
///
///Tables can share Outcomes (so editing it in one place edits it everywhere). The Outcome can have different weights on each Table.
class SmOutcome {
  String id;
  String rawText;
  ///Maps Table UUID Strings to this Outcome's weight on the Table with the UUID key.
  Map<String, int> weights;
  ///Tag UUID strings.
  List<String> tags;

  SmOutcome({
    required this.id,
    required this.rawText,
    required this.weights,
    required this.tags,
  });

  ///Builds an SmOutcome from the map produced by toMap.
  SmOutcome.fromMap(outcomeMap)
      : this(
          id: outcomeMap[kOUTCOME_ID] ?? const Uuid().v1(),
          rawText: outcomeMap[kOUTCOME_RAWTEXT] ?? "",
          weights: outcomeMap[kOUTCOME_WEIGHTS] ?? {},
          tags: outcomeMap[kOUTCOME_TAGS] ?? [],
        );
  ///Builds a map that fromMap can use to rebuild this SmOutcome
  Map<String, dynamic> toMap() {
    return {
      kOUTCOME_ID: id,
      kOUTCOME_RAWTEXT: rawText,
      kOUTCOME_WEIGHTS: weights,
      kOUTCOME_TAGS: tags,
    };
  }

  ///Provides a blank SmOutcome with a valid UUID
  SmOutcome.blank() : this( id: const Uuid().v1(), rawText: "", weights: {}, tags: []);

  ///Retreives specific weights as though the SmOutcome object is itself a map.
  int? operator[](String tableID) {
    return weights[tableID];
  }
}
