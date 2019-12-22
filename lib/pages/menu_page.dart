import 'package:fl_player/data/artist.dart';
import 'package:flutter/material.dart';

import '../datasource/native_library.dart' as nativeLib;
import '../widgets/artist_list.dart';

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
        title: Text('Artists'),
      ),
      body: FutureBuilder<List<Artist>>(
        future: nativeLib.getAllArtists(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ArtistList(
              artists: snapshot.data,
              onSelect: (artist) {
                Navigator.pushNamed(context, '/albums');
                print(artist.name);
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
