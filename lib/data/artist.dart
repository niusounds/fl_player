class Artist {
  final String name;
  final int albumCount;

  const Artist({
    this.name,
    this.albumCount,
  });

  factory Artist.fromJson(Map json) => Artist(
        name: json['artist'],
        albumCount: json['number_of_albums'],
      );
}
