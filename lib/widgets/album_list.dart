import 'dart:io';

import 'package:fl_player/db.dart';
import 'package:flutter/material.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({
    Key key,
    @required this.albums,
    @required this.onSelect,
  }) : super(key: key);

  final List<Album> albums;
  final ValueChanged<Album> onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return ListTile(
          leading: album.image != null
              ? Image.file(File(album.image))
              : const AlbumNoImage(),
          title: Text(album.name),
          subtitle: Text(album.yearDisplay),
          trailing: Text('54:41'),
          onTap: () => onSelect(album),
        );
      },
    );
  }
}

class AlbumNoImage extends StatelessWidget {
  const AlbumNoImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

extension AlbumYear on Album {
  String get yearDisplay => year != null ? '$year年' : '';
}
