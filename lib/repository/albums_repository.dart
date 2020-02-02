import 'package:fl_player/db.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:moor/moor.dart';

class AlbumsRepository {
  AlbumsRepository({
    @required this.dao,
    @required this.audioQuery,
  })  : assert(dao != null),
        assert(audioQuery != null);

  final AlbumsDao dao;
  final FlutterAudioQuery audioQuery;

  Future<void> refresh(Artist artist) async {
    final List<AlbumInfo> albums = await audioQuery.getAlbumsFromArtist(
      artist: artist.name,
    );

    for (final album in albums) {
      if (!await dao.exists(album.id)) {
        await dao.insert(AlbumsCompanion.insert(
          id: album.id,
          artistId: artist.id,
          name: album.title != null ? Value(album.title) : const Value.absent(),
        ));
      }
    }
  }

  // Stream<List<Album>> get allAlbums async* {
  //   final count = await dao.count;
  //   if (count == 0) {
  //     await refresh();
  //   }

  //   yield* dao.watchAll();
  // }

  Stream<List<Album>> albumForArtist(Artist artist) async* {
    if (!await dao.existsForArtist(artist.id)) {
      await refresh(artist);
    }

    yield* dao.watchByArtist(artist.id);
  }
}
