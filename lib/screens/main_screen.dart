import 'package:flutter/material.dart';
import '../widgets/movie_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MovieCard(
              movie: Movie(
                title: 'Movie Title 1',
                details: 'Details 1',
                description: 'Description 1',
                imageUrl: 'assets/movie1.jpg', // Example image path
              ),
            ),
            MovieCard(
              movie: Movie(
                title: 'Movie Title 2',
                details: 'Details 2',
                description: 'Description 2',
                imageUrl: 'assets/movie2.jpg', // Example image path
              ),
            ),
            MovieCard(
              movie: Movie(
                title: 'Movie Title 2',
                details: 'Details 2',
                description: 'Description 2',
                imageUrl: 'assets/movie2.jpg', // Example image path
              ),
            ),
            MovieCard(
              movie: Movie(
                title: 'Movie Title 2',
                details: 'Details 2',
                description: 'Description 2',
                imageUrl: 'assets/movie2.jpg', // Example image path
              ),
            ),
            MovieCard(
              movie: Movie(
                title: 'Movie Title 2',
                details: 'Details 2',
                description: 'Description 2',
                imageUrl: 'assets/movie2.jpg', // Example image path
              ),
            ),
            MovieCard(
              movie: Movie(
                title: 'Movie Title 2',
                details: 'Details 2',
                description: 'Description 2',
                imageUrl: 'assets/movie2.jpg', // Example image path
              ),
            ),
            MovieCard(
              movie: Movie(
                title: 'Movie Title 2',
                details: 'Details 2',
                description: 'Description 2',
                imageUrl: 'assets/movie2.jpg', // Example image path
              ),
            ),
            MovieCard(
              movie: Movie(
                title: 'Movie Title 2',
                details: 'Details 2',
                description: 'Description 2',
                imageUrl: 'assets/movie2.jpg', // Example image path
              ),
            ),
            // Add more MovieCards here as needed
          ],
        ),
      ),
    );
  }
}
