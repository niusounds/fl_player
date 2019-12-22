import 'data.dart';

List<Artist> get mockArtists => [
      Artist(
        name: 'Amaranthe',
        albumCount: 2,
      ),
      Artist(
        name: 'Alestorm',
        albumCount: 2,
      ),
      Artist(
        name: 'Korpiklaani',
        albumCount: 6,
      ),
      Artist(
        name: 'Dragonforce',
        albumCount: 4,
      ),
      Artist(
        name: 'Equilibrium',
        albumCount: 3,
      ),
      Artist(
        name: 'Ensiferum',
        albumCount: 3,
      ),
      Artist(
        name: 'Nightwish',
        albumCount: 3,
      ),
      Artist(
        name: 'Rammstein',
        albumCount: 3,
      ),
      Artist(
        name: 'Wintersun',
        albumCount: 3,
      ),
      Artist(
        name: 'Xandria',
        albumCount: 3,
      ),
    ];
List<Album> get mockAlbums => [
      Album(
        name: 'Amaranthe', year: 2011,
        songs: [
          Song(
            title: 'Leave Everything Behind',
            length: Duration(minutes: 3, seconds: 19),
          ),
          Song(
            title: 'Hunger',
            length: Duration(minutes: 3, seconds: 13),
          ),
          Song(
            title: '1.000.000 Lightyears',
            length: Duration(minutes: 3, seconds: 16),
          ),
          Song(
            title: 'Automatic',
            length: Duration(minutes: 3, seconds: 26),
          ),
          Song(
            title: 'My Transition',
            length: Duration(minutes: 3, seconds: 50),
          ),
          Song(
            title: 'Amaranthine',
            length: Duration(minutes: 3, seconds: 30),
          ),
          Song(
            title: 'Rain',
            length: Duration(minutes: 3, seconds: 45),
          ),
          Song(
            title: 'Call Out My Name',
            length: Duration(minutes: 3, seconds: 17),
          ),
          Song(
            title: 'Director\'s Cut',
            length: Duration(minutes: 4, seconds: 5),
          ),
          Song(
            title: 'Act of Desperation',
            length: Duration(minutes: 3, seconds: 5),
          ),
          Song(
            title: 'Serendipity',
            length: Duration(minutes: 3, seconds: 26),
          ),
        ],
// The Nexus (2013)
// Massive Addictive (2014)
// Maximalism (2016)
// Helix (2018)',
      ),
    ];
