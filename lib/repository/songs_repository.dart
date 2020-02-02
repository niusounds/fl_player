import 'package:fl_player/db.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:moor/moor.dart';

class SongsRepository {
  SongsRepository({
    @required this.dao,
    @required this.audioQuery,
  })  : assert(dao != null),
        assert(audioQuery != null);

  final SongsDao dao;
  final FlutterAudioQuery audioQuery;

  Future<void> refresh(Album album) async {
    final List<SongInfo> songs = await audioQuery.getSongsFromAlbum(
      albumId: album.id,
    );

    for (final song in songs) {
      if (!await dao.exists(song.id)) {
        await dao.insert(SongsCompanion.insert(
          id: song.id,
          albumId: album.id,
          artistId: album.artistId,
          title: song.title != null ? Value(song.title) : const Value.absent(),
          track: song.track != null ? Value(song.track) : const Value.absent(),
        ));
      }
    }
  }

  // Stream<List<Song>> songsForArtist(Artist artist) async* {
  //   if (!await dao.existsForArtist(artist.id)) {
  //     await refresh(artist);
  //   }

  //   yield* dao.watchByArtist(artist.id);
  // }

  /// アルバムの楽曲を取得する。
  Stream<List<Song>> songsForAlbum(Album album) async* {
    if (!await dao.existsForAlbum(album.id)) {
      await refresh(album);
    }

    yield* dao.watchByAlbum(album.id);
  }
}
