import 'package:flutter/material.dart';

import 'pages/albums_page.dart';
import 'pages/menu_page.dart';

void main() => runApp(FlPlayerApp());

class FlPlayerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FL Player',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => const MenuPage(),
        '/albums': (context) => const AlbumsPage(),
      },
    );
  }
}
