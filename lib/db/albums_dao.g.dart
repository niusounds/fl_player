// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AlbumsDaoMixin on DatabaseAccessor<MusicDatabase> {
  $AlbumsTable get albums => db.albums;
  Album _rowToAlbum(QueryRow row) {
    return Album(
      id: row.readString('id'),
      artistId: row.readString('artist_id'),
      name: row.readString('name'),
    );
  }

  Selectable<Album> allQuery() {
    return customSelectQuery('SELECT * FROM albums ORDER BY name',
        variables: [], readsFrom: {albums}).map(_rowToAlbum);
  }

  Future<List<Album>> all() {
    return allQuery().get();
  }

  Stream<List<Album>> watchAll() {
    return allQuery().watch();
  }

  Selectable<int> _countQuery() {
    return customSelectQuery('SELECT COUNT(*) FROM albums',
        variables: [],
        readsFrom: {albums}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> _count() {
    return _countQuery().get();
  }

  Stream<List<int>> _watchCount() {
    return _countQuery().watch();
  }

  Selectable<Album> byIdQuery(String id) {
    return customSelectQuery('SELECT * FROM albums WHERE id = :id',
        variables: [Variable.withString(id)],
        readsFrom: {albums}).map(_rowToAlbum);
  }

  Future<List<Album>> byId(String id) {
    return byIdQuery(id).get();
  }

  Stream<List<Album>> watchById(String id) {
    return byIdQuery(id).watch();
  }

  Selectable<Album> byArtistQuery(String artistId) {
    return customSelectQuery('SELECT * FROM albums WHERE artist_id = :artistId',
        variables: [Variable.withString(artistId)],
        readsFrom: {albums}).map(_rowToAlbum);
  }

  Future<List<Album>> byArtist(String artistId) {
    return byArtistQuery(artistId).get();
  }

  Stream<List<Album>> watchByArtist(String artistId) {
    return byArtistQuery(artistId).watch();
  }
}
