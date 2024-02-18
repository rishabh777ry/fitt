import 'package:flutter/material.dart';

class MeditationChantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation Chants'),
      ),
      body: MeditationChantsList(),
    );
  }
}

class MeditationChantsList extends StatelessWidget {
  final List<String> songs = [
    'Song 1',
    'Song 2',
    'Song 3',
    // Add more songs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(songs[index]),
          onTap: () {
            // Handle tap on song
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MediaPlayerScreen(song: songs[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class MediaPlayerScreen extends StatelessWidget {
  final String song;

  MediaPlayerScreen({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song),
      ),
      body: Center(
        child: Text('Media Player for $song'),
      ),
    );
  }
}
