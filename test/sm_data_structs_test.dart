import 'package:sans_master_tables/outcome_manager.dart';
import 'package:test/test.dart';
import 'package:sans_master_tables/smtable.dart';
import 'package:sans_master_tables/constants/smkeys.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/validation.dart';
import 'package:sans_master_tables/smoutcome.dart';

void main() {
  // ignore: unused_local_variable
  var logger = Logger();
  
  group('SmOutcome initialization from Map', () {
    //implicitly tests the default constructor
    String mRawText = "mock Outcome raw text";
    String table1ID = const Uuid().v1();
    int table1Weight = 1;
    String table2ID = const Uuid().v1();
    int table2Weight = 1;
    String outcome1ID = const Uuid().v1();
    Set<String> outcome1tags = {const Uuid().v1(), const Uuid().v1()};

    Map<String, dynamic> mOutcomeComplete = {
      kOUTCOME_ID: outcome1ID,
      kOUTCOME_RAWTEXT: mRawText,
      kOUTCOME_WEIGHTS: {table1ID: table1Weight, table2ID: table2Weight},
      kOUTCOME_TAGS: outcome1tags,
    };

    Map<String, dynamic> mOutcomeBlank = {};

    test('id - validity and uniqueness', () {
      final outcome1 = SmOutcome.fromMap(mOutcomeComplete);
      final outcome2 = SmOutcome.fromMap(mOutcomeBlank);

      //validity
      expect(UuidValidation.isValidUUID(fromString: outcome1.id), true);
      expect(UuidValidation.isValidUUID(fromString: outcome2.id), true);

      //uniqueness
      expect(outcome1.id, isNot(equals(outcome2.id)));
    });

    test('rawText', () {
      final outcome = SmOutcome.fromMap(mOutcomeComplete);

      expect(outcome.rawText, mRawText);
    });

    test('weights', () {
      final outcome1 = SmOutcome.fromMap(mOutcomeComplete);
      final outcome2 = SmOutcome.fromMap(mOutcomeBlank);

      //weights load correctly
      expect(outcome1[table1ID], table1Weight);
      expect(outcome1[table2ID], table2Weight);

      //no weights are fine too
      expect(outcome2.weights, {});
    });

    test('tags', () {
      final outcome1 = SmOutcome.fromMap(mOutcomeComplete);
      final outcome2 = SmOutcome.fromMap(mOutcomeBlank);

      //complete map
      expect(outcome1.tags, outcome1tags);
      //incomplete map
      expect(outcome2.tags, <String>{});
    });
  });

  group('SmOutcome methods', (){
    String mRawText = "mock Outcome raw text";
    String table1ID = const Uuid().v1();
    int table1Weight = 1;
    String table2ID = const Uuid().v1();
    int table2Weight = 1;
    String outcome1ID = const Uuid().v1();
    String outcome1tag1 = const Uuid().v1();
    String outcome1tag2 = const Uuid().v1();
    Set<String> outcome1tags = {outcome1tag1, outcome1tag2};
    
    Map<String, dynamic> mOutcomeComplete = {
      kOUTCOME_ID: outcome1ID,
      kOUTCOME_RAWTEXT: mRawText,
      kOUTCOME_WEIGHTS: {table1ID: table1Weight, table2ID: table2Weight},
      kOUTCOME_TAGS: outcome1tags,
    };
    
    test('toMap', (){
      final outcome = SmOutcome.fromMap(mOutcomeComplete);

      expect(outcome.toMap(), mOutcomeComplete);
    });

    test('Add table weight', (){
      final outcome = SmOutcome.fromMap(mOutcomeComplete);
      final String newTableID = const Uuid().v1();
      const int newTableWeight = 3;

      outcome[newTableID] = newTableWeight;

      expect(outcome[newTableID], newTableWeight);
    });

    test('Remove table weight', (){
      final SmOutcome outcome = SmOutcome.fromMap(mOutcomeComplete);
      outcome.remove(table1ID);

      expect(outcome[table1ID], null);
    });

    test('Update table weight', (){
      final SmOutcome outcome = SmOutcome.fromMap(mOutcomeComplete);
      int newWeight = table1Weight + 10;
      outcome[table1ID] = newWeight;

      expect(outcome[table1ID], newWeight);
    });

    test('Is on table?', (){
      final SmOutcome outcome = SmOutcome.fromMap(mOutcomeComplete);
      final String otherTable = Uuid().v1();

      //Outcome IS on the table
      expect(outcome.isOnTable(table1ID), true);
      //Outcome IS NOT on the table
      expect(outcome.isOnTable(otherTable), false);
    });

    test('Add tags', (){
      final SmOutcome outcome = SmOutcome.fromMap(mOutcomeComplete);
      final List<String> newTags = [Uuid().v1(), Uuid().v1()];
      
      Set<String> expectedSet = {};
      expectedSet.addAll(outcome.tags);
      expectedSet.addAll(newTags);
      
      outcome.addTags(newTags);

      expect(outcome.tags, expectedSet);
    });

    test("Remove tags", (){
      final SmOutcome outcome = SmOutcome.fromMap(mOutcomeComplete);
      final List<String> newTags = [Uuid().v1(), Uuid().v1()];

      Set<String> removeTheseTags = outcome1tags.toSet();
      outcome.addTags(newTags);
      outcome.removeTags(removeTheseTags);

      expect(outcome.tags, newTags);
    });
  
    test("Is tagged", (){
      final SmOutcome outcome = SmOutcome.fromMap(mOutcomeComplete);
      outcome.addTags({outcome1tag1});
      
      //IS tagged
      expect(outcome.isTagged(outcome1tag1), true);
      //is NOT tagged
      expect(outcome.isTagged(const Uuid().v1()), false);
    });
  });
  
   group('OutcomeManager', () {
    test('Singleton initialization', () {
      OutcomeManager oManager1 = OutcomeManager();
      OutcomeManager oManager2 = OutcomeManager();

      expect(oManager1, equals(oManager2));
    });

    test('getOutcomes', () {
      OutcomeManager oManager = OutcomeManager();
      //TODO: come back to this test
      //oManager.loadOutcomes(outcomeIDs)

    });

    test('accessing Outcome weights', () {
      //TODO: write this test
      //does OutcomeManager()[outcomeID][tableID] access the correct weight?
    });
  });

  
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

    test('outcomes IDs list', () {
      final table = SmTable.fromMap(mTable);

      expect(table.outcomes, mOutcomes);
    });

    test('outcomes loaded', () {
      final table = SmTable.fromMap(mTable);

      //TODO: come back to this test
      //expect(table.outcomes, equals(OutcomeManager().getOutcomes))
    });

    /* test('totalWeight', () {
      final table = SmTable.fromMap(mTable);

      expect(table.totalWeight, 10);
    }); */
  });
}
