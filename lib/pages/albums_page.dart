import 'package:flutter/material.dart';

import '../mock.dart';
import '../widgets/album_list.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage();

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: AlbumList(
        albums: mockAlbums,
        onSelect: (album) {
          print(album.name);
        },
      ),
    );
  }
}
