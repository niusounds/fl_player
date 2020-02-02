import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:fl_player/db.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({
    Key key,
    @required this.artists,
    @required this.onSelect,
  }) : super(key: key);

  final List<Artist> artists;
  final ValueChanged<Artist> onSelect;

  @override
  _ArtistListState createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  Map<String, List<Artist>> _artists;
  List<String> _initials;

  @override
  void initState() {
    super.initState();
    _prepareArtists();
  }

  @override
  void didUpdateWidget(ArtistList old) {
    super.didUpdateWidget(old);
    if (old.artists != widget.artists) {
      _prepareArtists();
    }
  }

  void _prepareArtists() {
    _artists = groupBy(widget.artists, (artist) => artist.name.substring(0, 1));
    _initials = _artists.keys.toList()..sort();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _initials.length,
      itemBuilder: (context, index) {
        final initial = _initials[index];
        final artists = _artists[initial];
        return StickyHeader(
          header: Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              initial,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          content: Column(
            children: ListTile.divideTiles(
              context: context,
              tiles: artists.map(
                (artist) => ListTile(
                  title: Text(artist.name),
                  // subtitle: Text('${artist.albumCount} albums'),
                  onTap: () => widget.onSelect(artist),
                ),
              ),
            ).toList(),
          ),
        );
      },
    );
  }
}
