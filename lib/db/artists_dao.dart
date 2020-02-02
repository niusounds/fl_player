import 'package:moor/moor.dart';

import 'db.dart';

part 'artists_dao.g.dart';

@UseDao(
  tables: [Artists],
  queries: {
    'all': 'SELECT * FROM artists ORDER BY name',
    '_count': 'SELECT COUNT(*) FROM artists',
    'byId': 'SELECT * FROM artists WHERE id = :id',
  },
)
class ArtistsDao extends DatabaseAccessor<MusicDatabase>
    with _$ArtistsDaoMixin {
  ArtistsDao(MusicDatabase db) : super(db);

  Future<int> get count => _countQuery().getSingle();

  /// [id]のアーティストが存在するかどうか。
  Future<bool> exists(String id) async {
    return (await byId(id)).isNotEmpty;
  }

  Future<int> insert(ArtistsCompanion row) {
    return into(artists).insert(row);
  }
}
