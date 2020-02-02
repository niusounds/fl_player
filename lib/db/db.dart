import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'albums_dao.dart';
import 'artists_dao.dart';
import 'songs_dao.dart';

part 'db.g.dart';

class Artists extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get numberOfAlbums => text().nullable()();
}

class Albums extends Table {
  TextColumn get id => text()();
  TextColumn get artistId => text()();
  TextColumn get name => text().nullable()();
  IntColumn get songs => integer()();
  IntColumn get year => integer().nullable()();
}

class Songs extends Table {
  TextColumn get id => text()();
  TextColumn get artistId => text()();
  TextColumn get albumId => text()();
  TextColumn get title => text().nullable()();
  TextColumn get track => text().nullable()();
}

@UseMoor(
  tables: [Artists, Albums, Songs],
  daos: [ArtistsDao, AlbumsDao, SongsDao],
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
