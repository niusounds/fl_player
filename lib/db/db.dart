import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'albums_dao.dart';
import 'artists_dao.dart';

part 'db.g.dart';

class Artists extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
}

class Albums extends Table {
  TextColumn get id => text()();
  TextColumn get artistId => text()();
  TextColumn get name => text().nullable()();
}

@UseMoor(
  tables: [Artists, Albums],
  daos: [ArtistsDao, AlbumsDao],
)
class MusicDatabase extends _$MusicDatabase {
  MusicDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase.memory(logStatements: true);
    return VmDatabase(file);
  });
}
