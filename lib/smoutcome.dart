import 'constants/smkeys.dart';
import 'package:uuid/uuid.dart';

class SmOutcome {
  String id;
  String rawText;

  //Table UUID Strings : this Outcomes weight on that table
  Map<String, int> weights;

  SmOutcome({
    required this.id,
    required this.rawText,
    this.weights = const {},
  });

  SmOutcome.fromMap(outcomeMap)
      : this(
          id: outcomeMap[kOUTCOME_ID] ?? const Uuid().v1(),
          rawText: outcomeMap[kOUTCOME_RAWTEXT],
          weights: outcomeMap[kOUTCOME_WEIGHTS] ?? const {},
        );
}
