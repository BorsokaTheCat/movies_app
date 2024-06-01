import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String overview;
  final String posterPath;

  const MovieCard({
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              title: title,
              overview: overview,
              posterPath: posterPath,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4, // Adjust elevation as needed
        margin: EdgeInsets.all(8), // Adjust margin as needed
        child: ListTile(
          title: Text(title),
          subtitle: Text(overview),
          leading: Image.network(
            'https://image.tmdb.org/t/p/w200$posterPath',
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
