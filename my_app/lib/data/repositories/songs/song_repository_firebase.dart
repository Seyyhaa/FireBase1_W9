import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  static final Uri baseUri = Uri.https(
    'seyha-learn-first-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
  );
  final Uri songsUri = baseUri.replace(path: '/songs.json');

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> bodyJson = json.decode(response.body);

      List<Song> result = [];
      for (var i in bodyJson.entries) {
        String id = i.key;
        Map<String, dynamic> value = i.value;
        Song song = SongDto.fromJson(value, id);
        result.add(song);
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}
}
