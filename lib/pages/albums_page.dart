import 'package:flutter/material.dart';

import '../data/album.dart';
import '../datasource/native_library.dart' as nativeLib;
import '../widgets/album_list.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({
    Key key,
    @required this.artistName,
  })  : assert(artistName != null),
        super(key: key);

  final String artistName;

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  Future<List<Album>> _future;

  @override
  void initState() {
    super.initState();
    _future = nativeLib.getAlbumsForArtist(
      artistName: widget.artistName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: FutureBuilder<List<Album>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AlbumList(
              albums: snapshot.data,
              onSelect: (album) {
                print(album.name);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
