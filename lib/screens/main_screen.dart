import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_services.dart';
import '../widgets/movie_card.dart';

class MainScreen extends StatelessWidget {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _apiService.getNowPlayingMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final results = snapshot.data?['results'] ?? [];
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final movie = results[index];
                return MovieCard(
                  title: movie['title'],
                  overview: movie['overview'],
                  posterPath: movie['poster_path'],
                );
              },
            );
          }
        },
      ),
    );
  }
}


