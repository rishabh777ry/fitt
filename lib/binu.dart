import 'package:flutter/material.dart';

class BinauralBeatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binaural Beats'),
      ),
      body: BinauralBeatsList(),
    );
  }
}

class BinauralBeatsList extends StatelessWidget {
  final List<String> beats = [
    'Beat 1',
    'Beat 2',
    'Beat 3',
    // Add more beats as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: beats.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(beats[index]),
          onTap: () {
            // Handle tap on beat
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MediaPlayerScreen(song: beats[index]),
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
