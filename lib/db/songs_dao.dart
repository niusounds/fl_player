import 'package:moor/moor.dart';

import 'db.dart';

part 'songs_dao.g.dart';

@UseDao(
  tables: [Songs],
  queries: {
    'all': 'SELECT * FROM songs',
    '_count': 'SELECT COUNT(*) FROM songs',
    '_countForArtist': 'SELECT COUNT(*) FROM songs WHERE artist_id = :artistId',
    '_countForAlbum': 'SELECT COUNT(*) FROM songs WHERE album_id = :albumId',
    'byId': 'SELECT * FROM songs WHERE id = :id',
    'byArtist': 'SELECT * FROM songs WHERE artist_id = :artistId',
    'byAlbum': 'SELECT * FROM songs WHERE album_id = :albumId',
  },
)
class SongsDao extends DatabaseAccessor<MusicDatabase> with _$SongsDaoMixin {
  SongsDao(MusicDatabase db) : super(db);

  Future<int> get count => _countQuery().getSingle();

  /// [id]の曲が存在するかどうか。
  Future<bool> exists(String id) async {
    return (await byId(id)).isNotEmpty;
  }

  /// アルバムの曲が存在するかどうか。
  Future<bool> existsForAlbum(String albumId) async {
    return (await _countForAlbumQuery(albumId).getSingle()) > 0;
  }

  Future<int> insert(SongsCompanion row) {
    return into(songs).insert(row);
  }
}
