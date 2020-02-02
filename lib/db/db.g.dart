// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Artist extends DataClass implements Insertable<Artist> {
  final String id;
  final String name;
  Artist({@required this.id, @required this.name});
  factory Artist.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Artist(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  factory Artist.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Artist(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  @override
  ArtistsCompanion createCompanion(bool nullToAbsent) {
    return ArtistsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  Artist copyWith({String id, String name}) => Artist(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Artist(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Artist && other.id == this.id && other.name == this.name);
}

class ArtistsCompanion extends UpdateCompanion<Artist> {
  final Value<String> id;
  final Value<String> name;
  const ArtistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ArtistsCompanion.insert({
    @required String id,
    @required String name,
  })  : id = Value(id),
        name = Value(name);
  ArtistsCompanion copyWith({Value<String> id, Value<String> name}) {
    return ArtistsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

class $ArtistsTable extends Artists with TableInfo<$ArtistsTable, Artist> {
  final GeneratedDatabase _db;
  final String _alias;
  $ArtistsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $ArtistsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'artists';
  @override
  final String actualTableName = 'artists';
  @override
  VerificationContext validateIntegrity(ArtistsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Artist map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Artist.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ArtistsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    return map;
  }

  @override
  $ArtistsTable createAlias(String alias) {
    return $ArtistsTable(_db, alias);
  }
}

class Album extends DataClass implements Insertable<Album> {
  final String id;
  final String artistId;
  final String name;
  final int songs;
  final int year;
  Album(
      {@required this.id,
      @required this.artistId,
      this.name,
      @required this.songs,
      this.year});
  factory Album.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Album(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      artistId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}artist_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      songs: intType.mapFromDatabaseResponse(data['${effectivePrefix}songs']),
      year: intType.mapFromDatabaseResponse(data['${effectivePrefix}year']),
    );
  }
  factory Album.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Album(
      id: serializer.fromJson<String>(json['id']),
      artistId: serializer.fromJson<String>(json['artistId']),
      name: serializer.fromJson<String>(json['name']),
      songs: serializer.fromJson<int>(json['songs']),
      year: serializer.fromJson<int>(json['year']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'artistId': serializer.toJson<String>(artistId),
      'name': serializer.toJson<String>(name),
      'songs': serializer.toJson<int>(songs),
      'year': serializer.toJson<int>(year),
    };
  }

  @override
  AlbumsCompanion createCompanion(bool nullToAbsent) {
    return AlbumsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      artistId: artistId == null && nullToAbsent
          ? const Value.absent()
          : Value(artistId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      songs:
          songs == null && nullToAbsent ? const Value.absent() : Value(songs),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
    );
  }

  Album copyWith(
          {String id, String artistId, String name, int songs, int year}) =>
      Album(
        id: id ?? this.id,
        artistId: artistId ?? this.artistId,
        name: name ?? this.name,
        songs: songs ?? this.songs,
        year: year ?? this.year,
      );
  @override
  String toString() {
    return (StringBuffer('Album(')
          ..write('id: $id, ')
          ..write('artistId: $artistId, ')
          ..write('name: $name, ')
          ..write('songs: $songs, ')
          ..write('year: $year')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(artistId.hashCode,
          $mrjc(name.hashCode, $mrjc(songs.hashCode, year.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Album &&
          other.id == this.id &&
          other.artistId == this.artistId &&
          other.name == this.name &&
          other.songs == this.songs &&
          other.year == this.year);
}

class AlbumsCompanion extends UpdateCompanion<Album> {
  final Value<String> id;
  final Value<String> artistId;
  final Value<String> name;
  final Value<int> songs;
  final Value<int> year;
  const AlbumsCompanion({
    this.id = const Value.absent(),
    this.artistId = const Value.absent(),
    this.name = const Value.absent(),
    this.songs = const Value.absent(),
    this.year = const Value.absent(),
  });
  AlbumsCompanion.insert({
    @required String id,
    @required String artistId,
    this.name = const Value.absent(),
    @required int songs,
    this.year = const Value.absent(),
  })  : id = Value(id),
        artistId = Value(artistId),
        songs = Value(songs);
  AlbumsCompanion copyWith(
      {Value<String> id,
      Value<String> artistId,
      Value<String> name,
      Value<int> songs,
      Value<int> year}) {
    return AlbumsCompanion(
      id: id ?? this.id,
      artistId: artistId ?? this.artistId,
      name: name ?? this.name,
      songs: songs ?? this.songs,
      year: year ?? this.year,
    );
  }
}

class $AlbumsTable extends Albums with TableInfo<$AlbumsTable, Album> {
  final GeneratedDatabase _db;
  final String _alias;
  $AlbumsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _artistIdMeta = const VerificationMeta('artistId');
  GeneratedTextColumn _artistId;
  @override
  GeneratedTextColumn get artistId => _artistId ??= _constructArtistId();
  GeneratedTextColumn _constructArtistId() {
    return GeneratedTextColumn(
      'artist_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _songsMeta = const VerificationMeta('songs');
  GeneratedIntColumn _songs;
  @override
  GeneratedIntColumn get songs => _songs ??= _constructSongs();
  GeneratedIntColumn _constructSongs() {
    return GeneratedIntColumn(
      'songs',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  GeneratedIntColumn _year;
  @override
  GeneratedIntColumn get year => _year ??= _constructYear();
  GeneratedIntColumn _constructYear() {
    return GeneratedIntColumn(
      'year',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, artistId, name, songs, year];
  @override
  $AlbumsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'albums';
  @override
  final String actualTableName = 'albums';
  @override
  VerificationContext validateIntegrity(AlbumsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.artistId.present) {
      context.handle(_artistIdMeta,
          artistId.isAcceptableValue(d.artistId.value, _artistIdMeta));
    } else if (isInserting) {
      context.missing(_artistIdMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    }
    if (d.songs.present) {
      context.handle(
          _songsMeta, songs.isAcceptableValue(d.songs.value, _songsMeta));
    } else if (isInserting) {
      context.missing(_songsMeta);
    }
    if (d.year.present) {
      context.handle(
          _yearMeta, year.isAcceptableValue(d.year.value, _yearMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Album map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Album.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AlbumsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.artistId.present) {
      map['artist_id'] = Variable<String, StringType>(d.artistId.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.songs.present) {
      map['songs'] = Variable<int, IntType>(d.songs.value);
    }
    if (d.year.present) {
      map['year'] = Variable<int, IntType>(d.year.value);
    }
    return map;
  }

  @override
  $AlbumsTable createAlias(String alias) {
    return $AlbumsTable(_db, alias);
  }
}

class Song extends DataClass implements Insertable<Song> {
  final String id;
  final String artistId;
  final String albumId;
  final String title;
  final String track;
  Song(
      {@required this.id,
      @required this.artistId,
      @required this.albumId,
      this.title,
      this.track});
  factory Song.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Song(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      artistId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}artist_id']),
      albumId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}album_id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      track:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}track']),
    );
  }
  factory Song.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Song(
      id: serializer.fromJson<String>(json['id']),
      artistId: serializer.fromJson<String>(json['artistId']),
      albumId: serializer.fromJson<String>(json['albumId']),
      title: serializer.fromJson<String>(json['title']),
      track: serializer.fromJson<String>(json['track']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'artistId': serializer.toJson<String>(artistId),
      'albumId': serializer.toJson<String>(albumId),
      'title': serializer.toJson<String>(title),
      'track': serializer.toJson<String>(track),
    };
  }

  @override
  SongsCompanion createCompanion(bool nullToAbsent) {
    return SongsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      artistId: artistId == null && nullToAbsent
          ? const Value.absent()
          : Value(artistId),
      albumId: albumId == null && nullToAbsent
          ? const Value.absent()
          : Value(albumId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      track:
          track == null && nullToAbsent ? const Value.absent() : Value(track),
    );
  }

  Song copyWith(
          {String id,
          String artistId,
          String albumId,
          String title,
          String track}) =>
      Song(
        id: id ?? this.id,
        artistId: artistId ?? this.artistId,
        albumId: albumId ?? this.albumId,
        title: title ?? this.title,
        track: track ?? this.track,
      );
  @override
  String toString() {
    return (StringBuffer('Song(')
          ..write('id: $id, ')
          ..write('artistId: $artistId, ')
          ..write('albumId: $albumId, ')
          ..write('title: $title, ')
          ..write('track: $track')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(artistId.hashCode,
          $mrjc(albumId.hashCode, $mrjc(title.hashCode, track.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Song &&
          other.id == this.id &&
          other.artistId == this.artistId &&
          other.albumId == this.albumId &&
          other.title == this.title &&
          other.track == this.track);
}

class SongsCompanion extends UpdateCompanion<Song> {
  final Value<String> id;
  final Value<String> artistId;
  final Value<String> albumId;
  final Value<String> title;
  final Value<String> track;
  const SongsCompanion({
    this.id = const Value.absent(),
    this.artistId = const Value.absent(),
    this.albumId = const Value.absent(),
    this.title = const Value.absent(),
    this.track = const Value.absent(),
  });
  SongsCompanion.insert({
    @required String id,
    @required String artistId,
    @required String albumId,
    this.title = const Value.absent(),
    this.track = const Value.absent(),
  })  : id = Value(id),
        artistId = Value(artistId),
        albumId = Value(albumId);
  SongsCompanion copyWith(
      {Value<String> id,
      Value<String> artistId,
      Value<String> albumId,
      Value<String> title,
      Value<String> track}) {
    return SongsCompanion(
      id: id ?? this.id,
      artistId: artistId ?? this.artistId,
      albumId: albumId ?? this.albumId,
      title: title ?? this.title,
      track: track ?? this.track,
    );
  }
}

class $SongsTable extends Songs with TableInfo<$SongsTable, Song> {
  final GeneratedDatabase _db;
  final String _alias;
  $SongsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _artistIdMeta = const VerificationMeta('artistId');
  GeneratedTextColumn _artistId;
  @override
  GeneratedTextColumn get artistId => _artistId ??= _constructArtistId();
  GeneratedTextColumn _constructArtistId() {
    return GeneratedTextColumn(
      'artist_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _albumIdMeta = const VerificationMeta('albumId');
  GeneratedTextColumn _albumId;
  @override
  GeneratedTextColumn get albumId => _albumId ??= _constructAlbumId();
  GeneratedTextColumn _constructAlbumId() {
    return GeneratedTextColumn(
      'album_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _trackMeta = const VerificationMeta('track');
  GeneratedTextColumn _track;
  @override
  GeneratedTextColumn get track => _track ??= _constructTrack();
  GeneratedTextColumn _constructTrack() {
    return GeneratedTextColumn(
      'track',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, artistId, albumId, title, track];
  @override
  $SongsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'songs';
  @override
  final String actualTableName = 'songs';
  @override
  VerificationContext validateIntegrity(SongsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.artistId.present) {
      context.handle(_artistIdMeta,
          artistId.isAcceptableValue(d.artistId.value, _artistIdMeta));
    } else if (isInserting) {
      context.missing(_artistIdMeta);
    }
    if (d.albumId.present) {
      context.handle(_albumIdMeta,
          albumId.isAcceptableValue(d.albumId.value, _albumIdMeta));
    } else if (isInserting) {
      context.missing(_albumIdMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    }
    if (d.track.present) {
      context.handle(
          _trackMeta, track.isAcceptableValue(d.track.value, _trackMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Song map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Song.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SongsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.artistId.present) {
      map['artist_id'] = Variable<String, StringType>(d.artistId.value);
    }
    if (d.albumId.present) {
      map['album_id'] = Variable<String, StringType>(d.albumId.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.track.present) {
      map['track'] = Variable<String, StringType>(d.track.value);
    }
    return map;
  }

  @override
  $SongsTable createAlias(String alias) {
    return $SongsTable(_db, alias);
  }
}

abstract class _$MusicDatabase extends GeneratedDatabase {
  _$MusicDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ArtistsTable _artists;
  $ArtistsTable get artists => _artists ??= $ArtistsTable(this);
  $AlbumsTable _albums;
  $AlbumsTable get albums => _albums ??= $AlbumsTable(this);
  $SongsTable _songs;
  $SongsTable get songs => _songs ??= $SongsTable(this);
  ArtistsDao _artistsDao;
  ArtistsDao get artistsDao =>
      _artistsDao ??= ArtistsDao(this as MusicDatabase);
  AlbumsDao _albumsDao;
  AlbumsDao get albumsDao => _albumsDao ??= AlbumsDao(this as MusicDatabase);
  SongsDao _songsDao;
  SongsDao get songsDao => _songsDao ??= SongsDao(this as MusicDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [artists, albums, songs];
}
