import 'package:fl_player/data.dart';
import 'package:flutter/services.dart';

const _channel = const MethodChannel('fl_player/native_library');

Future<List<Artist>> getAllArtists() async {
  final List<Map> results = await _channel.invokeListMethod('getAllArtists');

  if (results != null) {
    return results.map((item) => Artist.fromJson(item)).toList();
  } else {
    return const [];
  }
}

Future<List<Album>> getAlbumsForArtist({
  String artistName,
}) async {
  final List<Map> results =
      await _channel.invokeListMethod('getAlbumsForArtist', {
    'artistName': artistName,
  });

  if (results != null) {
    return results.map((item) => Album.fromJson(item)).toList();
  } else {
    return const [];
  }
}

Future<List<Song>> getSongsForAlbum({
  int albumId,
}) async {
  final List<Map> results =
      await _channel.invokeListMethod('getSongsForAlbum', {
    'albumId': albumId,
  });

  if (results != null) {
    return results.map((item) => Song.fromJson(item)).toList();
  } else {
    return const [];
  }
}
