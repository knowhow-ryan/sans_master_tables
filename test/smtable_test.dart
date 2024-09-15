import 'package:test/test.dart';
import 'package:sans_master_tables/smtable.dart';
import 'package:sans_master_tables/constants/smkeys.dart';
import 'package:logger/logger.dart';

void main() {
  var logger = Logger();
  group('Table Initialization from Map', () {
    const String mTitle = 'Mock Table Title';

    Map<String, dynamic> mTable = {
      kTABLE_TITLE: mTitle,
    };

    test('Title', () {
      final table = SmTable.fromMap(mTable);

      expect(table.title, mTitle);
    });
  });
}
