import 'package:moor/moor.dart';

import 'db.dart';

part 'albums_dao.g.dart';

@UseDao(
  tables: [Albums],
  queries: {
    'all': 'SELECT * FROM albums ORDER BY name',
    '_count': 'SELECT COUNT(*) FROM albums',
    'byId': 'SELECT * FROM albums WHERE id = :id',
    'byArtist': 'SELECT * FROM albums WHERE artist_id = :artistId'
  },
)
class AlbumsDao extends DatabaseAccessor<MusicDatabase> with _$AlbumsDaoMixin {
  AlbumsDao(MusicDatabase db) : super(db);

  Future<int> get count => _countQuery().getSingle();

  /// [id]のアルバムが存在するかどうか。
  Future<bool> exists(String id) async {
    return (await byId(id)).isNotEmpty;
  }

  /// アーティストのアルバムが存在するかどうか。
  Future<bool> existsForArtist(String artistId) async {
    return (await byArtist(artistId)).isNotEmpty;
  }

  Future<int> insert(AlbumsCompanion row) {
    return into(albums).insert(row);
  }
}
