import 'package:myfirst_firebase/model/artists/artist.dart';

class Song {
  final String id;
  final String imageUrl;
  final String title;
  final String artistId;
  final Duration duration;

  Artist? artist;

  Song({
    required this.imageUrl,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.id,
    this.artist
  });

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist: $artistId, duration: $duration,imageUrl: $imageUrl)';
  }
}
