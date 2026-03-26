import 'package:flutter/material.dart';
import 'package:myfirst_firebase/data/repositories/artists/artist_repository.dart';
import 'package:myfirst_firebase/model/artists/artist.dart';

import '../../../utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;

  AsyncValue<List<Artist>> artistValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository}) {
    // init
    _init();
  }

  void _init() async {
    fetchArtists();
  }

  void fetchArtists() async {
    // 1- Loading state
    artistValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Artist> artists = await artistRepository.fetchArtists();
      artistValue = AsyncValue.success(artists);
    } catch (e) {
      // 3- Fetch is unsucessfull
      artistValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
