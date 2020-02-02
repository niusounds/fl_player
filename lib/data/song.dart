class Song {
  final int id;
  final String title;
  final Duration length;

  const Song({
    this.id,
    this.title,
    this.length,
  });

  factory Song.fromJson(Map json) => Song(
        id: json['_id'],
        title: json['title'],
        length: Duration(milliseconds: json['duration']),
      );
}
