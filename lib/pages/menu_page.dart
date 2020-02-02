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
  Future<List<Artist>> _future;

  @override
  void initState() {
    super.initState();
    _future = nativeLib.getAllArtists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<Artist>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ArtistList(
                artists: snapshot.data,
                onSelect: (artist) {
                  Navigator.pushNamed(
                    context,
                    '/albums',
                    arguments: artist.name,
                  );
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
      ),
    );
  }

  Future<void> _refresh() {
    setState(() {
      _future = nativeLib.getAllArtists();
    });
    return _future;
  }
}
