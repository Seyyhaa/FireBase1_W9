class Song {
  final String id;
  final String imageUrl;
  final String title;
  final String artist;
  final Duration duration;

  Song({
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.duration, required this.id,
  });

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist: $artist, duration: $duration,imageUrl: $imageUrl)';
  }
}
