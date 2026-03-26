import 'package:flutter/material.dart';

import 'package:myfirst_firebase/model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(song.imageUrl.toString()),),
          onTap: onTap,
          title: Text(song.title),
          subtitle: Text('${song.duration.inMinutes > 0 ? "${song.duration.inMinutes}mins" : "${song.duration.inMinutes}min"}        ${song.artist?.name}-${song.artist?.genre}'),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
