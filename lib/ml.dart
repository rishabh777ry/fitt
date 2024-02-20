import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'medi.dart';
import 'binu.dart';
import 'yoga.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation '),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Carousel widget
            CarouselWidget(),
            SizedBox(height: 20),
            // Two buttons for Meditation Chants and Binaural Beats
            ButtonRow(),
            SizedBox(height: 20),
            // Chart section
            ChartSection(),
          ],
        ),
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  final List<String> images = [
    'assets/p.jpg',
    'assets/Chandra Namaskar.jpeg',
    'assets/Surya Namaskar.jpeg',
    'assets/Vrikshasana.jpeg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: images.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle navigation to Yoga screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MCQScreen()),
            );
          },
          child: Text(
            'Yoga',
            style: TextStyle(fontSize: 20), // Increase font size
          ),
        ),
        SizedBox(height: 10), // Add spacing between the buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle navigation to Meditation Chants screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MeditationChantsScreen()),
                );
              },
              child: Text('Meditation Chants'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BinauralBeatsScreen()),
                );
                // Handle navigation to Binaural Beats screen
              },
              child: Text('Binaural Beats'),
            ),
          ],
        ),
      ],
    );
  }
}

class ChartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Genres',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          GenreCard(
            genre: 'Meditation Chants',
            image: 'assets/b.jpg',
            onTap: () {
              // Handle tap on Meditation Chants card
            },
          ),
          SizedBox(height: 10),
          GenreCard(
            genre: 'Binaural Beats',
            image: 'assets/p.jpg',
            onTap: () {
              // Handle tap on Binaural Beats card
            },
          ),
          // Add more GenreCard widgets for other genres as needed
        ],
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  final String genre;
  final String image;
  final VoidCallback onTap;

  GenreCard({required this.genre, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                image,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                genre,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
