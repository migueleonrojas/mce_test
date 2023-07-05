import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'mce_database.g.dart';

class Sportsfields extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameSportsfields => text()();
}

class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameSportsfields => text()();
  DateTimeColumn get schedulingDate => dateTime()();
  TextColumn get schedulerPerson => text()();
}

@DriftDatabase(tables: [Sportsfields, Schedules])
class MceDatabase extends _$MceDatabase {

  MceDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mce_database.db'));
    return NativeDatabase.createInBackground(file);
  });
}

final mceDatabase = MceDatabase();