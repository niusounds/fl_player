// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ArtistsDaoMixin on DatabaseAccessor<MusicDatabase> {
  $ArtistsTable get artists => db.artists;
  Artist _rowToArtist(QueryRow row) {
    return Artist(
      id: row.readString('id'),
      name: row.readString('name'),
    );
  }

  Selectable<Artist> allQuery() {
    return customSelectQuery('SELECT * FROM artists ORDER BY name',
        variables: [], readsFrom: {artists}).map(_rowToArtist);
  }

  Future<List<Artist>> all() {
    return allQuery().get();
  }

  Stream<List<Artist>> watchAll() {
    return allQuery().watch();
  }

  Selectable<int> _countQuery() {
    return customSelectQuery('SELECT COUNT(*) FROM artists',
        variables: [],
        readsFrom: {artists}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> _count() {
    return _countQuery().get();
  }

  Stream<List<int>> _watchCount() {
    return _countQuery().watch();
  }

  Selectable<Artist> byIdQuery(String id) {
    return customSelectQuery('SELECT * FROM artists WHERE id = :id',
        variables: [Variable.withString(id)],
        readsFrom: {artists}).map(_rowToArtist);
  }

  Future<List<Artist>> byId(String id) {
    return byIdQuery(id).get();
  }

  Stream<List<Artist>> watchById(String id) {
    return byIdQuery(id).watch();
  }
}
