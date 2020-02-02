class Album {
  final int id;
  final String name;
  final String imagePath;
  final int year;
  final int songs;

  const Album({
    this.id,
    this.name,
    this.imagePath,
    this.year,
    this.songs,
  });

  factory Album.fromJson(Map json) => Album(
        id: json['_id'],
        name: json['album'],
        imagePath: json['album_art'],
        year: json['minyear'] ?? json['maxyear'],
        songs: json['numsongs'],
      );
}
