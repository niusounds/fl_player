import 'package:fl_player/db.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:moor/moor.dart';

class ArtistsRepository {
  ArtistsRepository({
    @required this.dao,
    @required this.audioQuery,
  })  : assert(dao != null),
        assert(audioQuery != null);

  final ArtistsDao dao;
  final FlutterAudioQuery audioQuery;

  Future<void> refresh() async {
    final List<ArtistInfo> artists = await audioQuery.getArtists();

    for (final artist in artists) {
      if (!await dao.exists(artist.id)) {
        await dao.insert(ArtistsCompanion.insert(
          id: artist.id,
          name: artist.name,
        ));
      }
    }
  }

  Stream<List<Artist>> get allArtists async* {
    final count = await dao.count;
    if (count == 0) {
      await refresh();
    }

    yield* dao.watchAll();
  }
}
