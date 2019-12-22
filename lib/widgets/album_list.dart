import 'package:flutter/material.dart';

import '../data.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({
    Key key,
    @required this.albums,
    @required this.onSelect,
  }) : super(key: key);

  final List<Album> albums;
  final ValueChanged<Artist> onSelect;

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<Album> _sorted;

  @override
  void initState() {
    super.initState();
    _sorted = List.from(widget.albums, growable: false)
      ..sort((a, b) => a.year.compareTo(b.year));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _sorted.length,
      itemBuilder: (context, index) {
        final album = _sorted[index];
        return ListTile(
          leading: Image.network('https://picsum.photos/320/320'),
          title: Text(album.name),
          subtitle: Text('${album.year}'),
          trailing: Text('54:41'),
        );
      },
    );
  }
}