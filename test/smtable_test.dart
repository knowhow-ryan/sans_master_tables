import 'package:test/test.dart';
import 'package:sans_master_tables/smtable.dart';
import 'package:sans_master_tables/constants/smkeys.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/validation.dart';

void main() {
  // ignore: unused_local_variable
  var logger = Logger();
  group('Table Initialization from Map', () {
    const String mTitle = 'Mock Table Title';
    List<String> mOutcomes = [
      const Uuid().v1(),
      const Uuid().v1(),
      const Uuid().v1(),
    ];

    Map<String, dynamic> mTable = {
      kTABLE_TITLE: mTitle,
      kTABLE_OUTCOMES: mOutcomes,
    };

    test('id - validity and uniqueness', () {
      final table1 = SmTable.fromMap(mTable);
      final table2 = SmTable.fromMap(mTable);

      //validity
      expect(UuidValidation.isValidUUID(fromString: table1.id), true);
      expect(UuidValidation.isValidUUID(fromString: table2.id), true);

      //uniqueness
      expect(table1.id, isNot(equals(table2.id)));
    });

    test('title', () {
      final table = SmTable.fromMap(mTable);

      expect(table.title, mTitle);
    });

    test('outcomes', () {
      final table = SmTable.fromMap(mTable);

      expect(table.outcomes, mOutcomes);
    });

    test('totalWeight', () {
      final table = SmTable.fromMap(mTable);

      expect(table.totalWeight, 10);
    });
  });

  group('OutcomeManager', () {});
}
