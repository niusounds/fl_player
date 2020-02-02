import 'package:fl_player/db.dart';
import 'package:fl_player/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({
    Key key,
    @required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player'),
      ),
      body: Consumer<SongsRepository>(
        builder: (context, repo, _) {
          return StreamProvider.value(
            value: repo.songsForAlbum(album),
            child: Consumer<List<Song>>(
              builder: (context, songs, _) {
                print(songs);
                return Text('TODO');
              },
            ),
          );
        },
      ),
    );
  }
}
