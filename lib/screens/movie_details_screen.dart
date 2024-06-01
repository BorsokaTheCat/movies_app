import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String title;
  final String overview;
  final String posterPath;

  const MovieDetailsScreen({
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w200$posterPath',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              overview,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
