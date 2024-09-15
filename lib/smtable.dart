import 'package:sans_master_tables/constants/smkeys.dart';

class SmTable {
  String title;

  SmTable({required this.title});

  SmTable.fromMap(tableMap) : this(title: tableMap[kTABLE_TITLE]);
}
