import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myfirst_firebase/data/dtos/artist_dto.dart';
import 'package:myfirst_firebase/data/repositories/artists/artist_repository.dart';
import 'package:myfirst_firebase/model/artists/artist.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  static final Uri baseUri = Uri.https(
    'seyha-learn-first-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
  );
   final Uri songsUri = baseUri.replace(path: '/artists.json');
  @override
  Future<List<Artist>> fetchArtists() async {
    // TODO: implement fetchArtists
     final http.Response response = await http.get(songsUri);
 if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> bodyJson = json.decode(response.body);

      List<Artist> result = [];
      for (var i in bodyJson.entries) {
        String id = i.key;
        Map<String, dynamic> value = i.value;
        Artist song = ArtistDto.fromJson(value, id);
        result.add(song);
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }
  }