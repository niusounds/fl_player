import 'package:fl_player/db.dart';
import 'package:fl_player/repository.dart';
import 'package:fl_player/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage();

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists'),
      ),
      body: Consumer<ArtistsRepository>(
        builder: (context, repo, _) {
          return StreamProvider.value(
            value: repo.allArtists,
            child: Consumer<List<Artist>>(
              builder: (context, artists, _) {
                if (artists == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => repo.refresh(),
                  child: ArtistList(
                    artists: artists,
                    onSelect: _toAlbumsPage,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _toAlbumsPage(Artist artist) {
    Navigator.pushNamed(
      context,
      '/albums',
      arguments: artist,
    );
  }
}
