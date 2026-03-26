import 'package:myfirst_firebase/model/artists/artist.dart';

class ArtistDto {
  static const String imageUrlKey = 'imageUrl';
  static const String genreKey = 'genre';
  static const String nameKey = 'name';

  static Artist fromJson(Map<String, dynamic> json, String id) {
    assert(json[imageUrlKey] is String);
    assert(json[genreKey] is String);
    assert(json[nameKey] is String);

    return Artist(
      imageUrl: json[imageUrlKey],
      name: json[nameKey],
      id: id,
      genre: json[genreKey],
    );
  }
  //convert to JSon
  Map<String, dynamic> toJson(Artist artist) {
    return {
      imageUrlKey:artist.imageUrl,
      nameKey:artist.name,
      genreKey:artist.genre,
    };
  }
}
