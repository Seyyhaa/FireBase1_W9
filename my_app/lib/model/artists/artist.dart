class Artist {
  final String id;
  final String imageUrl;
  final String name;
  final String genre;
  
  

  Artist({
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.genre,
  });

  @override
  String toString() {
    return 'Artist(id: $id, title: $name, genre: $genre, imageUrl:$imageUrl )';
  }
}
