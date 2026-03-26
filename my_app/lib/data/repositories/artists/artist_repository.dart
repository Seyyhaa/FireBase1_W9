import 'package:myfirst_firebase/model/artists/artist.dart';

abstract class ArtistRepository{
   Future<List<Artist>> fetchArtists();
}