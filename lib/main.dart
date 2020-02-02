import 'package:fl_player/db.dart';
import 'package:fl_player/pages/player_page.dart';
import 'package:fl_player/repository.dart';
import 'package:fl_player/repository/songs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:provider/provider.dart';

import 'pages/albums_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(Provider<MusicDatabase>(
    create: (_) => MusicDatabase(),
    child: MultiProvider(
      providers: [
        Provider<ArtistsRepository>(
          create: (context) => ArtistsRepository(
            dao: Provider.of<MusicDatabase>(context, listen: false).artistsDao,
            audioQuery: FlutterAudioQuery(),
          ),
        ),
        Provider<AlbumsRepository>(
          create: (context) => AlbumsRepository(
            dao: Provider.of<MusicDatabase>(context, listen: false).albumsDao,
            audioQuery: FlutterAudioQuery(),
          ),
        ),
        Provider<SongsRepository>(
          create: (context) => SongsRepository(
            dao: Provider.of<MusicDatabase>(context, listen: false).songsDao,
            audioQuery: FlutterAudioQuery(),
          ),
        ),
      ],
      child: FlPlayerApp(),
    ),
    dispose: (context, db) => db.close(),
  ));
}

class FlPlayerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FL Player',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => const MenuPage(),
        '/albums': (context) {
          return AlbumsPage(
            artist: ModalRoute.of(context).settings.arguments,
          );
        },
        '/player': (context) {
          return PlayerPage(
            album: ModalRoute.of(context).settings.arguments,
          );
        }
      },
    );
  }
}
