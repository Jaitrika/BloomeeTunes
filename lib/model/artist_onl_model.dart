// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:Bloomee/model/MediaPlaylistModel.dart';
import 'package:Bloomee/model/album_onl_model.dart';
import 'package:Bloomee/model/songModel.dart';

class ArtistModel {
  String name;
  String imageUrl;
  String sourceURL;
  String source;
  String sourceId;
  String? description;
  String? genre;
  String? country;
  List<MediaItemModel> songs;
  List<AlbumModel> albums;

  ArtistModel({
    required this.name,
    required this.imageUrl,
    required this.source,
    required this.sourceId,
    required this.sourceURL,
    this.description,
    this.genre,
    this.country,
    this.songs = const [],
    this.albums = const [],
  });

  @override
  String toString() {
    return 'ArtistModel(name: $name, imageUrl: $imageUrl, profileURL: $sourceURL, source: $source, sourceId: $sourceId, description: $description, songs: $songs, albums: $albums)';
  }

  get playlist {
    return MediaPlaylist(
      playlistName: name,
      description: description ?? '',
      source: source,
      permaURL: sourceURL,
      imgUrl: imageUrl,
      mediaItems: songs,
      artists: name,
      isAlbum: false,
      lastUpdated: DateTime.now(),
    );
  }

  ArtistModel copyWith({
    String? name,
    String? imageUrl,
    String? sourceURL,
    String? source,
    String? sourceId,
    String? description,
    String? genre,
    String? country,
    List<MediaItemModel>? songs,
    List<AlbumModel>? albums,
  }) {
    return ArtistModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      sourceURL: sourceURL ?? this.sourceURL,
      source: source ?? this.source,
      sourceId: sourceId ?? this.sourceId,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      country: country ?? this.country,
      songs: songs ?? this.songs,
      albums: albums ?? this.albums,
    );
  }
}

List<ArtistModel> saavnMap2Artists(Map<String, dynamic> json) {
  List<ArtistModel> artists = [];
  if (json['Artists'] != null) {
    json['Artists'].forEach((artist) {
      artists.add(ArtistModel(
        name: artist['title'],
        imageUrl: artist['image'],
        source: 'saavn',
        sourceId: artist['artistId'],
        sourceURL: artist['perma_url'],
        genre: artist['genre'],
        country: artist['country'],
        description: artist['subtitle'],
      ));
    });
  }
  return artists;
}
