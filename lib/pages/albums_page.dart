import 'package:fl_player/db.dart';
import 'package:fl_player/repository.dart';
import 'package:fl_player/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({
    Key key,
    @required this.artist,
  })  : assert(artist != null),
        super(key: key);

  final Artist artist;

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: Consumer<AlbumsRepository>(
        builder: (context, repo, _) {
          return StreamProvider.value(
            value: repo.albumForArtist(widget.artist),
            child: Consumer<List<Album>>(
              builder: (context, albums, _) {
                if (albums == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => repo.refresh(widget.artist),
                  child: AlbumList(
                    albums: albums,
                    onSelect: (album) {},
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
