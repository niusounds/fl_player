import 'song.dart';

class Album {
  final String name;
  final int year;
  final List<Song> songs;

  const Album({
    this.name,
    this.year,
    this.songs,
  });
}
