// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$SongsDaoMixin on DatabaseAccessor<MusicDatabase> {
  $SongsTable get songs => db.songs;
  Song _rowToSong(QueryRow row) {
    return Song(
      id: row.readString('id'),
      artistId: row.readString('artist_id'),
      albumId: row.readString('album_id'),
      title: row.readString('title'),
      track: row.readString('track'),
    );
  }

  Selectable<Song> allQuery() {
    return customSelectQuery('SELECT * FROM songs',
        variables: [], readsFrom: {songs}).map(_rowToSong);
  }

  Future<List<Song>> all() {
    return allQuery().get();
  }

  Stream<List<Song>> watchAll() {
    return allQuery().watch();
  }

  Selectable<int> _countQuery() {
    return customSelectQuery('SELECT COUNT(*) FROM songs',
        variables: [],
        readsFrom: {songs}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> _count() {
    return _countQuery().get();
  }

  Stream<List<int>> _watchCount() {
    return _countQuery().watch();
  }

  Selectable<int> _countForArtistQuery(String artistId) {
    return customSelectQuery(
        'SELECT COUNT(*) FROM songs WHERE artist_id = :artistId',
        variables: [Variable.withString(artistId)],
        readsFrom: {songs}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> _countForArtist(String artistId) {
    return _countForArtistQuery(artistId).get();
  }

  Stream<List<int>> _watchCountForArtist(String artistId) {
    return _countForArtistQuery(artistId).watch();
  }

  Selectable<int> _countForAlbumQuery(String albumId) {
    return customSelectQuery(
        'SELECT COUNT(*) FROM songs WHERE album_id = :albumId',
        variables: [Variable.withString(albumId)],
        readsFrom: {songs}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> _countForAlbum(String albumId) {
    return _countForAlbumQuery(albumId).get();
  }

  Stream<List<int>> _watchCountForAlbum(String albumId) {
    return _countForAlbumQuery(albumId).watch();
  }

  Selectable<Song> byIdQuery(String id) {
    return customSelectQuery('SELECT * FROM songs WHERE id = :id',
        variables: [Variable.withString(id)],
        readsFrom: {songs}).map(_rowToSong);
  }

  Future<List<Song>> byId(String id) {
    return byIdQuery(id).get();
  }

  Stream<List<Song>> watchById(String id) {
    return byIdQuery(id).watch();
  }

  Selectable<Song> byArtistQuery(String artistId) {
    return customSelectQuery('SELECT * FROM songs WHERE artist_id = :artistId',
        variables: [Variable.withString(artistId)],
        readsFrom: {songs}).map(_rowToSong);
  }

  Future<List<Song>> byArtist(String artistId) {
    return byArtistQuery(artistId).get();
  }

  Stream<List<Song>> watchByArtist(String artistId) {
    return byArtistQuery(artistId).watch();
  }

  Selectable<Song> byAlbumQuery(String albumId) {
    return customSelectQuery('SELECT * FROM songs WHERE album_id = :albumId',
        variables: [Variable.withString(albumId)],
        readsFrom: {songs}).map(_rowToSong);
  }

  Future<List<Song>> byAlbum(String albumId) {
    return byAlbumQuery(albumId).get();
  }

  Stream<List<Song>> watchByAlbum(String albumId) {
    return byAlbumQuery(albumId).watch();
  }
}
